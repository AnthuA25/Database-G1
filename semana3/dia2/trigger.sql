-- TRIGGER
create trigger tg_alumno_foto
before insert
on tbl_alumno for each row
begin 
	set new.alumno_foto = 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
end;

insert into tbl_alumno(alumno_nombre,alumno_apellido)
values('JOSE','LINARES');

select * from tbl_alumno;
