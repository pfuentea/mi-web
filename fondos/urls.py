from django.urls import path
from . import views

urlpatterns = [
    path('dashboard/', views.dashboard, name='dashboard'),
    path('admin-usuarios/', views.manage_users, name='manage_users'),
    path('admin-actividades/', views.admin_dashboard, name='admin_dashboard'),
    path('admin-actividades/editar/<int:activity_id>/', views.edit_activity, name='edit_activity'),
    path('admin-actividades/repartir/<int:activity_id>/', views.distribute_funds, name='distribute_funds'),
    path('distribucion/editar/<int:dist_id>/', views.edit_distribution, name='edit_distribution'),
    path('distribucion/eliminar/<int:dist_id>/', views.delete_distribution, name='delete_distribution'),
]
