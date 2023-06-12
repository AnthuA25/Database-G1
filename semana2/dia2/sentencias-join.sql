select * from tbl_apoderado;
select * from tbl_parentesco where parentesco_id = 1

select ap.apoderado_nombre, ap.apoderado_apellido  from tbl_apoderado ap


-- joins - unir tablas
select ap.apoderado_nombre, ap.apoderado_apellido, p.parentesco_nombre from tbl_apoderado ap
inner join tbl_parentesco p on ap.parentesco_id = p.parentesco_id 

select ap.*, p.* from tbl_apoderado ap
join tbl_parentesco p

-- left - izquierda
select ap.*, p.* from tbl_apoderado ap
left join tbl_parentesco p on p.parentesco_id = ap.parentesco_id

insert into tbl_parentesco (parentesco_nombre) values('TIO')

-- right - derecha
select ap.*, p.* from tbl_apoderado ap
right join tbl_parentesco p on p.parentesco_id = ap.parentesco_id

insert into
tbl_alumno(alumno_nombre,alumno_apellido,alumno_fecha_nacimiento,alumno_foto)
values
('CHRISTIAN','LOPEZ','2009-11-13','imagen1.jpg'),
('RICARDO','GOMEZ','2008-11-03','imagen2.jpg'),
('LINA','GOMEZ','2010-03-01','imagen3.jpg');


insert into tbl_colegio (colegio_nombre)
values
('SAN AGUSTIN'),('COLEGIO PEPIN'),('LA CATOLICA')


select * from tbl_colegio; 

-- INFORMACION DE TODOS LOS ALUMNOS Y AQUELLOS QUE YA TENGAN MOVILIDAD ESCOLAR QUE ME APARESCA EL TIPO DE SERVICIO QUE TIENE
 select alu.alumno_nombre , alu.alumno_apellido,mov.movilidad_tipo_servicio  from tbl_alumno alu
 left join tbl_movilidad mov on alu.alumno_id = mov.alumno_id
 
-- RIGHT JOIN 
 -- todos los colegios y el nombre del docente de la movilidad
 select mov.movilidad_docente, col.colegio_nombre  from tbl_movilidad mov
 right join tbl_colegio col on mov.movilidad_id = col.colegio_id 
 
 select * from tbl_movilidad 
 
-- INNER JOIN
select
mov.movilidad_id as id,
concat(alu.alumno_nombre,' ',alu.alumno_apellido) as alumno,
mov.movilidad_tipo_servicio as "tipo de servicio",
col.colegio_nombre  as colegio,
grad.grado_nombre as grado,
grad.grado_nivel as nivel,
mov.movilidad_turno as turno,
mov.movilidad_seccion as seccion,
mov.movilidad_docente as docente,
concat(apo.apoderado_nombre,' ',apo.apoderado_apellido) as apoderado,
par.parentesco_nombre as parentesco,
apo.apoderado_telefono as "telefono contacto",
mov.movilidad_pago as pago
from tbl_movilidad mov
inner join tbl_alumno alu on mov.alumno_id = alu.alumno_id 
inner join tbl_colegio col on mov.colegio_id = col.colegio_id
inner join tbl_grado grad on mov.grado_id = grad.grado_id
inner join tbl_apoderado apo on mov.apoderado_id  = apo.apoderado_id
inner join tbl_parentesco par on apo.parentesco_id = par.parentesco_id
 
 




