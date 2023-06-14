select * from tbl_alumno
select * from tbl_movilidad tm 

use db_movilidad_escolar

-- procedimientos almacenados
-- CREATE PROCEDURE: nos permite crear procedimientos almacenados MySQL para su posterior ejecución.
create procedure listar_alumnos()
begin
	select * from tbl_alumno;
end

call listar_alumnos() 


-- bucle for 
create procedure ejemplo_bucle(in tope int, out suma int unsigned)
begin 
	declare contador INT;
	set contador = 1;
	set suma = 0;

	bucle: loop
		if contador > tope then
			leave bucle;
		end if;
	
		set suma = suma + contador;
		set contador =+ contador + 1;
		
	end loop;
	
end

call ejemplo_bucle(10,@resultado);
select @resultado;


-- problema3
drop procedure if exists sp_registrar_movilidad
create procedure sp_registrar_movilidad(
in nombre VARCHAR(100),in apellidos VARCHAR(100),
in grado INT,in apoderado INT,in colegio INT,
in vehiculo INT,in tipo VARCHAR(100),
in turno VARCHAR(100),in seccion VARCHAR(100),in docente VARCHAR(100))
begin
    declare alumnoid INT;
    declare pago DOUBLE;

    set pago = 0;
   
   	if tipo = 'COMPLETO' then
   		set pago = 150;
   	else
   		set pago = 120;
   	end if;

    insert into tbl_alumno(alumno_nombre,alumno_apellido)
    values (nombre,apellidos);

    select max(alumno_id) into alumnoid from tbl_alumno;

    insert into tbl_movilidad(movilidad_tipo_servicio,movilidad_turno,movilidad_seccion,movilidad_docente,movilidad_pago,colegio_id,apoderado_id,grado_id,vehiculo_id,alumno_id)
    values (tipo,turno,seccion,docente,pago,colegio,apoderado,grado,vehiculo,alumnoid);
end

call sp_registrar_movilidad('JESUS','VALDIVIA',1,1,1,1,'RETORNO','MAÑANA','A','RAUL GOMEZ');