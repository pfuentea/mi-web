from django.urls import path
from . import views

urlpatterns = [
    path('dashboard/', views.dashboard, name='dashboard'),
    path('admin-actividades/', views.admin_dashboard, name='admin_dashboard'),
    path('admin-actividades/repartir/<int:activity_id>/', views.distribute_funds, name='distribute_funds'),
]
