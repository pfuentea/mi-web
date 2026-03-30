from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.admin.views.decorators import staff_member_required
from .models import Student, Activity, FundDistribution
from django.contrib import messages

@login_required
def dashboard(request):
    if request.user.is_staff:
        # Redirigir administradores a su panel correspondiente
        return redirect('admin_dashboard')
        
    # Obtener los alumnos asociados al apoderado
    students = Student.objects.filter(parent=request.user)
    
    context = {
        'students': students
    }
    return render(request, 'fondos/dashboard.html', context)

@staff_member_required
def admin_dashboard(request):
    activities = Activity.objects.all().order_by('-date')
    if request.method == 'POST':
        # Crear nueva actividad
        name = request.POST.get('name')
        date = request.POST.get('date')
        description = request.POST.get('description', '')
        total_amount = request.POST.get('total_amount', 0)
        
        if name and date:
            Activity.objects.create(
                name=name, date=date, description=description, total_amount=total_amount
            )
            messages.success(request, 'Actividad creada con éxito.')
            return redirect('admin_dashboard')
            
    context = {
        'activities': activities
    }
    return render(request, 'fondos/admin_dashboard.html', context)

@staff_member_required
def distribute_funds(request, activity_id):
    activity = get_object_or_404(Activity, id=activity_id)
    students = Student.objects.all().order_by('first_name', 'last_name')
    
    if request.method == 'POST':
        selected_students_ids = request.POST.getlist('students')
        distribution_type = request.POST.get('distribution_type') # 'equal' or 'manual'
        
        if not selected_students_ids:
            messages.error(request, 'Debe seleccionar al menos un alumno.')
            return redirect('distribute_funds', activity_id=activity.id)

        selected_students = Student.objects.filter(id__in=selected_students_ids)

        if distribution_type == 'equal':
            total_amount = float(request.POST.get('total_amount', 0))
            if total_amount <= 0:
                messages.error(request, 'El monto a repartir debe ser mayor a 0.')
                return redirect('distribute_funds', activity_id=activity.id)
                
            amount_per_student = int(total_amount / len(selected_students))
            
            for student in selected_students:
                FundDistribution.objects.create(
                    student=student, activity=activity, amount=amount_per_student
                )
            messages.success(request, f'Dinero repartido equitativamente: ${amount_per_student} a {len(selected_students)} alumnos.')
            
        elif distribution_type == 'manual':
            assigned_count = 0
            for student in selected_students:
                amount_str = request.POST.get(f'amount_{student.id}', '0')
                if amount_str and amount_str.isdigit() and int(amount_str) > 0:
                    FundDistribution.objects.create(
                        student=student, activity=activity, amount=int(amount_str)
                    )
                    assigned_count += 1
            messages.success(request, f'Dinero asignado manualmente a {assigned_count} alumnos.')
            
        return redirect('admin_dashboard')

    # Distribuciones existentes
    existing_distributions = FundDistribution.objects.filter(activity=activity)
    distributed_ids = existing_distributions.values_list('student_id', flat=True)
    
    context = {
        'activity': activity,
        'students': students,
        'existing_distributions': existing_distributions,
        'distributed_ids': distributed_ids,
    }
    return render(request, 'fondos/distribute_funds.html', context)
