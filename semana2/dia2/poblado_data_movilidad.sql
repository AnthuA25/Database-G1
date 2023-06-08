insert into tbl_parentesco(parentesco_nombre)
values
('PADRE'),('MADRE');

insert into 
tbl_apoderado(apoderado_nombre,apoderado_apellido,apoderado_telefono,apoderado_documento_identidad,parentesco_id)
values
('JOEL','GOMEZ','99999','444444',1),
('ROCIO','ALBERCAR','88888','55555',2);


-- datos el alumno
-- FECHA MYSQL AÑO-MES-DIA
insert into
tbl_alumno(alumno_nombre,alumno_apellido,alumno_fecha_nacimiento,alumno_foto)
values
('SUSANA','CASTILLO','2009-11-13','imagen1.jpg'),
('MARLENE','GOMEZ','2008-11-3','imagen2.jpg'),
('MARIBEL','GOMEZ','2010-03-01','imagen3.jpg');


-- colegio
insert into
tbl_colegio(colegio_nombre)
values
('FE Y ALEGRIA');



-- grado
insert into
tbl_grado(grado_nombre,grado_nivel)
values
('1ERO','PRIMARIA'),
('2DO','PRIMARIA'),
('1ERO','SECUNDARIA');


-- vehiculos
insert into
tbl_vehiculo(vehiculo_placa,vehiculo_conductor)
values
('VHT-890','CESAR ALVAREZ'),
('VTU-100','MARIA LOPEZ');

-- insertar movilidad
-- RENAME TABLE db_movilidad_escolar.movilidad TO db_movilidad_escolar.tbl_movilidad;

insert into
tbl_movilidad(movilidad_tipo_servicio,movilidad_turno,
movilidad_seccion,movilidad_docente,movilidad_pago,colegio_id,apoderado_id,grado_id,vehiculo_id,alumno_id)
values
('COMPLETO','MAÑANA','A','ALICIA MARTINEZ',150,1,1,1,1,1),
('RECOJO','MAÑANA','B','FELIX PEREZ',120,1,2,1,1,2),
('RETORNO','MAÑANA','A','GLORIA RAMOS',120,1,1,3,2,3);




