from django.urls import path
from . import views

urlpatterns = [
    path('dashboard/', views.dashboard, name='dashboard'),
    path('admin-usuarios/', views.manage_users, name='manage_users'),
    path('admin-usuarios/editar-apoderado/<int:user_id>/', views.edit_user, name='edit_user'),
    path('admin-usuarios/editar-alumno/<int:student_id>/', views.edit_student, name='edit_student'),
    path('admin-usuarios/apoderado/<int:user_id>/', views.apoderado_detail, name='apoderado_detail'),
    path('admin-usuarios/alumno/<int:student_id>/', views.student_detail, name='student_detail'),
    path('admin-actividades/', views.admin_dashboard, name='admin_dashboard'),
    path('admin-actividades/editar/<int:activity_id>/', views.edit_activity, name='edit_activity'),
    path('admin-actividades/repartir/<int:activity_id>/', views.distribute_funds, name='distribute_funds'),
    path('distribucion/editar/<int:dist_id>/', views.edit_distribution, name='edit_distribution'),
    path('distribucion/eliminar/<int:dist_id>/', views.delete_distribution, name='delete_distribution'),
    path('cuotas/', views.cuotas_list, name='cuotas_list'),
    path('cuotas/<int:cuota_id>/', views.cuota_detail, name='cuota_detail'),
    path('cuotas/pago/<int:pago_id>/toggle/', views.toggle_pago, name='toggle_pago'),
]
