from django.contrib import admin
from .models import Student, Activity, FundDistribution

@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'last_name', 'parent', 'total_funds')
    search_fields = ('first_name', 'last_name')

@admin.register(Activity)
class ActivityAdmin(admin.ModelAdmin):
    list_display = ('name', 'date', 'total_amount')
    list_filter = ('date',)
    search_fields = ('name',)

@admin.register(FundDistribution)
class FundDistributionAdmin(admin.ModelAdmin):
    list_display = ('student', 'activity', 'amount', 'created_at')
    list_filter = ('activity', 'student')
