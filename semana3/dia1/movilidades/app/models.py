# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class TblAlumno(models.Model):
    alumno_id = models.AutoField(primary_key=True)
    alumno_nombre = models.CharField(max_length=255)
    alumno_apellido = models.CharField(max_length=255)
    alumno_fecha_nacimiento = models.DateField(blank=True, null=True)
    alumno_foto = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tbl_alumno'

    def __str__(self) -> str:
        return self.alumno_nombre + ' ' + self.alumno_apellido


class TblApoderado(models.Model):
    apoderado_id = models.AutoField(primary_key=True)
    apoderado_nombre = models.CharField(max_length=255)
    apoderado_apellido = models.CharField(max_length=45)
    apoderado_telefono = models.CharField(max_length=255)
    apoderado_documento_identidad = models.CharField(max_length=20, blank=True, null=True)
    parentesco = models.ForeignKey('TblParentesco', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'tbl_apoderado'
    
    def __str__(self) -> str:
        return self.apoderado_nombre + ' ' + self.apoderado_apellido


class TblColegio(models.Model):
    colegio_id = models.AutoField(primary_key=True)
    colegio_nombre = models.CharField(max_length=225)

    class Meta:
        managed = False
        db_table = 'tbl_colegio'

    def __str__(self) -> str:
        return self.colegio_nombre


class TblGrado(models.Model):
    grado_id = models.AutoField(primary_key=True)
    grado_nombre = models.CharField(max_length=50)
    grado_nivel = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tbl_grado'

    def __str__(self) -> str:
        return self.grado_nombre


class TblMovilidad(models.Model):
    movilidad_id = models.AutoField(primary_key=True)
    movilidad_tipo_servicio = models.CharField(max_length=45)
    movilidad_turno = models.CharField(max_length=45)
    movilidad_seccion = models.CharField(max_length=45)
    movilidad_docente = models.CharField(max_length=255)
    movilidad_pago = models.FloatField()
    colegio = models.ForeignKey(TblColegio, models.DO_NOTHING)
    alumno = models.ForeignKey(TblAlumno, models.DO_NOTHING)
    vehiculo = models.ForeignKey('TblVehiculo', models.DO_NOTHING)
    grado = models.ForeignKey(TblGrado, models.DO_NOTHING)
    apoderado = models.ForeignKey(TblApoderado, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'tbl_movilidad'

    def __str__(self) -> str:
        return self.movilidad_turno


class TblParentesco(models.Model):
    parentesco_id = models.AutoField(primary_key=True)
    parentesco_nombre = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'tbl_parentesco'

    def __str__(self) -> str:
        return self.parentesco_nombre


class TblVehiculo(models.Model):
    vehiculo_id = models.AutoField(primary_key=True)
    vehiculo_placa = models.CharField(max_length=20)
    vehiculo_conductor = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tbl_vehiculo'

    def __str__(self) -> str:
        return self.vehiculo_placa
