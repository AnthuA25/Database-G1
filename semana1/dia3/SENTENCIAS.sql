
create table productos(
	id int not null primary key auto_increment,
	codigo varchar(20) not null,
	descripcion varchar(255) not null,
	marca varchar(100) not null,
	costo double
);

insert into productos(codigo,descripcion,marca,costo)
values
('R001','ZAPATILLA TALLA 40','ADIDAS','250'),
('A001','ARROZ X KILO','CHEVERE','3.5'),
('T001','LAPTOP LENOVO I7 8G 82KB00G4LM','LENOVO','2899');

create table inventario(
	id int not null primary key auto_increment,
	fecha date not null,
	producto_id int not null,
	cantidad int not null,
	tipo varchar(20) not null,
	foreign key(producto_id) references productos(id)
);


insert into inventario (fecha,producto_id,cantidad,tipo)
values
('2023-05-01',1,100,'ingreso'),
('2023-05-02',1,10,'salida'),
('2023-05-03',1,40,'salida'),
('2023-05-01',2,100,'ingreso'),
('2023-05-02',2,50,'salida'),
('2023-05-03',2,40,'salida'),
('2023-05-01',3,10,'ingreso'),
('2023-05-02',3,1,'salida'),
('2023-05-03',3,2,'salida');


