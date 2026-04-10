from functools import wraps
from django.shortcuts import redirect


def get_current_curso(request):
    from .models import Curso
    curso_id = request.session.get('current_curso_id')
    if curso_id:
        try:
            return Curso.objects.get(id=curso_id, is_active=True)
        except Curso.DoesNotExist:
            del request.session['current_curso_id']
    return None


def can_manage_curso(user, curso):
    from .models import CursoMembresia
    if user.is_staff:
        return True
    return CursoMembresia.objects.filter(
        user=user,
        curso=curso,
        rol__in=[CursoMembresia.ROL_TESORERO, CursoMembresia.ROL_AYUDANTE],
    ).exists()


def is_tesorero_principal(user, curso):
    from .models import CursoMembresia
    return CursoMembresia.objects.filter(
        user=user, curso=curso,
        rol=CursoMembresia.ROL_TESORERO, is_principal=True,
    ).exists()


def get_user_cursos(user):
    from .models import Curso, CursoMembresia
    if user.is_staff:
        return Curso.objects.filter(is_active=True)
    return Curso.objects.filter(
        membresias__user=user,
        membresias__rol__in=[CursoMembresia.ROL_TESORERO, CursoMembresia.ROL_AYUDANTE],
        is_active=True,
    )


def gestor_required(view_func):
    @wraps(view_func)
    def wrapper(request, *args, **kwargs):
        if not request.user.is_authenticated:
            from django.conf import settings as django_settings
            return redirect(f"{django_settings.LOGIN_URL}?next={request.path}")
        curso = get_current_curso(request)
        if not curso:
            return redirect('select_curso')
        if request.user.is_staff or can_manage_curso(request.user, curso):
            return view_func(request, *args, **kwargs)
        return redirect('select_curso')
    return wrapper
