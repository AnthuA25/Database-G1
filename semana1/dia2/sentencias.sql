select * from alumnos;
select nombre, apellidos from alumnos;

-- concatena 
select concat(nombre, ' ', apellidos) as nombre_completo from alumnos;

-- muestra nota mayor y menor
select max(nota) from alumnos;
select min(nota) from alumnos;

-- promedio
select avg(nota) from alumnos;

select min(nota),max(nota), avg(nota) from alumnos;

-- no repetidos
-- seleccion de valores distintos
select distinct pais from alumnos;

select * from alumnos 
where pais='Peru';

-- numero de valores 
select count(*) from alumnos 
where nota > 10 
and pais='Peru';

select * from alumnos
where nota between 11 and 15;



-- 'a%' -> comienza con la a
-- '%a' -> termina en a
-- '%a%' -> que tienen a en cualquier posicion
-- '_a%' -> que tenga a en la segunda posicion
-- 'a_%_%' -> que comienza con “A” y tienen al menos 3 caracteres de longitud
-- 'a%o' -> que comienza con “A” y termina con “O”
-- NOT LIKE 'a%' -> que NO comienza con “A”
select * from alumnos 
where nombre like '%ana%';

select * from alumnos
where nombre regexp '^A'

select * from alumnos
where email like '%@hotmail.com';

-- group by -> es utilizada para especificar por qué criterio se pretende ordenar los registros de una tabla
-- order by -> desc-mayor a menor/ z-a --- asc- menor a mayor/ a-z
select pais,count(id) as total 
from alumnos
group by pais
order by count(id) desc;


select pais,count(id) as total from alumnos 
group by pais 
having total > 10
order by total desc;

-- mostrar el promedio de nota de alumnos por pais ordenado de mayor a menor 
select  pais,avg(nota) promedio from alumnos 
group by pais 
having count(*) > 10
order by promedio desc;

select * from alumnos where pais='Belarus'

select * from alumnos a where pais='Central African Republic';


-- mostar el numero de alumnos por pais que aprobaron  el curso considernado que la nota aprobatorio es mayor a 13

select pais,count(*) numero_aprobados
from alumnos 
where nota > 13
group by pais;

-- mostrar los alumnos de peru cuya nota es mayor al promedio de la nota total del pais 
select * from alumnos where pais='Peru'
select avg(nota) from alumnos where pais='Peru';
-- subconsultas
select * from alumnos where pais='Peru'
and nota > (select avg(nota) from alumnos where pais='Peru')


-- subconsultas en columnas y filas
select nombre, nota, (select avg(nota) from alumnos where pais='Peru') promedio,
(nota - (select avg(nota) from alumnos where pais='Peru')) as diferncia
from alumnos 
where pais='Peru'
and nota > (select avg(nota) from alumnos where pais='Peru');


-- subconsultas con group by 
select pais, count(id) total 
from alumnos
where nota > (select avg(alu_avg.nota) from alumnos alu_avg where alu_avg.pais=pais)
group by pais 
order by total desc;


-- insert 
insert into alumnos(nombre, apellidos,email,pais,nota)
values('Aylin','Santa Cruz Vargas','alyn963@htomail.com','Peru',20);

insert into alumnos(nombre, apellidos,email,pais,nota)
values('Roberto','Sanchez Santos','roberto9@hotmail.com','Peru',19),
('Robinho','Salcedo Huaman','robinho2@hotmail.com','Peru',18),
('Raul','Soto','raul@hotmail.com','Peru',17);



select * from alumnos where nombre = 'Aylin';

-- update 
update alumnos 
set id = 1001
where email = 'alyn963@htomail.com'

update alumnos
set id = 1002
where pais = 'Peru' and nombre = 'Roberto';

update alumnos 
set id = 1003
where pais = 'Peru' and nombre = 'Robinho';

update alumnos
set id = 1004
where pais = 'Peru' and nombre = 'Raul';



select * from alumnos where pais = 'Peru'

-- delete 

delete from alumnos
where id = 1004

-- truncate table alumnos;


