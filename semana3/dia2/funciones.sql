-- FUNCIONES

create function fn_contar_alumnos()
	returns int unsigned
begin
	declare total int unsigned;	
	
	select count(*) into total
	from tbl_alumno;
	
	return total;
end

select fn_contar_alumnos()


create function fn_total_alumnos_por_colegio(colegioid INT)
	returns int unsigned
begin
	declare total int unsigned;

	select count(*) into total
	from tbl_movilidad
	where colegio_id = colegioid;

	return total;
end


select fn_total_alumnos_por_colegio(1)

select colegio_nombre,fn_total_alumnos_por_colegio(colegio_id) from tbl_colegio
