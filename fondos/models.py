from django.db import models
from django.contrib.auth.models import User


class Curso(models.Model):
    TIPO_NORMAL = 'NORMAL'
    TIPO_AVANZADO = 'AVANZADO'
    TIPO_CHOICES = [
        (TIPO_NORMAL, 'Normal'),
        (TIPO_AVANZADO, 'Avanzado'),
    ]

    name = models.CharField(max_length=200, verbose_name="Nombre del Curso")
    year = models.IntegerField(verbose_name="Año")
    description = models.TextField(blank=True, verbose_name="Descripción")
    is_active = models.BooleanField(default=True, verbose_name="Activo")
    tipo = models.CharField(max_length=20, choices=TIPO_CHOICES, default=TIPO_NORMAL, verbose_name="Tipo de Plan")

    class Meta:
        verbose_name = "Curso"
        verbose_name_plural = "Cursos"
        ordering = ['-year', 'name']

    def __str__(self):
        return f"{self.name} ({self.year})"


class CursoMembresia(models.Model):
    ROL_TESORERO = 'TESORERO'
    ROL_AYUDANTE = 'AYUDANTE'
    ROL_APODERADO = 'APODERADO'
    ROL_CHOICES = [
        (ROL_TESORERO, 'Tesorero'),
        (ROL_AYUDANTE, 'Ayudante'),
        (ROL_APODERADO, 'Apoderado'),
    ]
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='membresias', verbose_name="Usuario")
    curso = models.ForeignKey(Curso, on_delete=models.CASCADE, related_name='membresias', verbose_name="Curso")
    rol = models.CharField(max_length=20, choices=ROL_CHOICES, verbose_name="Rol")
    is_principal = models.BooleanField(default=False, verbose_name="Tesorero Principal")

    class Meta:
        verbose_name = "Membresía de Curso"
        verbose_name_plural = "Membresías de Curso"
        unique_together = ['user', 'curso']

    def __str__(self):
        return f"{self.user.username} — {self.get_rol_display()} de {self.curso}"

    @property
    def puede_gestionar(self):
        return self.rol in (self.ROL_TESORERO, self.ROL_AYUDANTE)


class Student(models.Model):
    first_name = models.CharField(max_length=100, verbose_name="Nombre")
    last_name = models.CharField(max_length=100, verbose_name="Apellido")
    parent = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True, related_name='students', verbose_name="Apoderado")
    curso = models.ForeignKey(Curso, on_delete=models.SET_NULL, null=True, blank=True, related_name='students', verbose_name="Curso")

    class Meta:
        verbose_name = "Alumno"
        verbose_name_plural = "Alumnos"

    def __str__(self):
        return f"{self.first_name} {self.last_name}"

    @property
    def total_actividades(self):
        return sum(dist.amount for dist in self.distributions.all())

    @property
    def pagos_pagados(self):
        return self.pagos.filter(paid=True).select_related('cuota').order_by('-cuota__date')

    @property
    def pagos_pendientes(self):
        return self.pagos.filter(paid=False).select_related('cuota').order_by('-cuota__date')

    @property
    def total_cuotas_pagadas(self):
        return sum(p.cuota.amount for p in self.pagos_pagados)

    @property
    def total_funds(self):
        return self.total_actividades + self.total_cuotas_pagadas


class Activity(models.Model):
    name = models.CharField(max_length=200, verbose_name="Nombre de la Actividad")
    date = models.DateField(verbose_name="Fecha")
    description = models.TextField(blank=True, verbose_name="Descripción")
    total_amount = models.IntegerField(default=0, verbose_name="Monto total a repartir (opcional)", help_text="Monto referencial")
    curso = models.ForeignKey(Curso, on_delete=models.SET_NULL, null=True, blank=True, related_name='activities', verbose_name="Curso")

    class Meta:
        verbose_name = "Actividad"
        verbose_name_plural = "Actividades"

    def __str__(self):
        return f"{self.name} ({self.date})"


class FundDistribution(models.Model):
    student = models.ForeignKey(Student, on_delete=models.CASCADE, related_name='distributions', verbose_name="Alumno")
    activity = models.ForeignKey(Activity, on_delete=models.CASCADE, related_name='distributions', verbose_name="Actividad")
    amount = models.IntegerField(verbose_name="Monto")
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "Distribución de Fondo"
        verbose_name_plural = "Distribuciones de Fondos"

    def __str__(self):
        return f"{self.student} recibió ${self.amount} en {self.activity.name}"


class Cuota(models.Model):
    name = models.CharField(max_length=200, verbose_name="Nombre de la Cuota")
    amount = models.IntegerField(verbose_name="Monto por alumno")
    date = models.DateField(verbose_name="Fecha")
    description = models.TextField(blank=True, verbose_name="Descripción")
    curso = models.ForeignKey(Curso, on_delete=models.SET_NULL, null=True, blank=True, related_name='cuotas', verbose_name="Curso")

    class Meta:
        verbose_name = "Cuota"
        verbose_name_plural = "Cuotas"
        ordering = ['-date']

    def __str__(self):
        return f"{self.name} ({self.date})"

    @property
    def total_recaudado(self):
        return self.pagos.filter(paid=True).count() * self.amount


class PagoCuota(models.Model):
    student = models.ForeignKey(Student, on_delete=models.CASCADE, related_name='pagos', verbose_name="Alumno")
    cuota = models.ForeignKey(Cuota, on_delete=models.CASCADE, related_name='pagos', verbose_name="Cuota")
    paid = models.BooleanField(default=False, verbose_name="Pagado")
    paid_date = models.DateTimeField(null=True, blank=True, verbose_name="Fecha de Pago")

    class Meta:
        verbose_name = "Pago de Cuota"
        verbose_name_plural = "Pagos de Cuotas"
        unique_together = ['student', 'cuota']

    def __str__(self):
        status = "pagó" if self.paid else "debe"
        return f"{self.student} {status} {self.cuota.name}"
