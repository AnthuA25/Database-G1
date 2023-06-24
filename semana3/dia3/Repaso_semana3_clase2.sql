-- EJERICIO 1 : PROCEDIMIENTOS ALMACENADOS

select * from tbl_factura_cab
drop procedure if exists sp_registrar_fact_cab;

create procedure sp_registrar_fact_cab(
in serie varchar(20),in nro varchar(255),in fvencimiento date,
in femision date,in tipo_moneda varchar(45),in valorventa double,
in estado char(1),in fecha_log timestamp,in usuario_log varchar(255),
in idcliente int
)
begin
	declare vIgv double;
	declare vTotal double;

	set vIgv = valorventa * 0.18;
	set vTotal = valorventa + vIgv;

	insert into tbl_factura_cab (factura_cab_serie,factura_cab_nro,
	factura_cab_fvencimiento,factura_cab_femision,factura_cab_tipo_moneda,
	factura_cab_valorventa,factura_cab_valorigv,
	factura_cab_valortotal,factura_cab_estado,factura_cab_fecha_log,factura_cab_usuario_log,
	cliente_id)
	values(serie,nro,fvencimiento,femision,tipo_moneda,valorventa,
	vIgv,vTotal,estado,fecha_log,usuario_log,idcliente);

end;

call sp_registrar_fact_cab('F001','003','2023-06-30','2023-06-16','SOLES',2000,'1',current_timestamp(),'ADMIN',2)



-- EJERCICIO 2 : FUNCIONES
-- contar productos
select * from tbl_producto
select * from tbl_factura_det
create function fn_contar_productos(productoid int )
	returns int unsigned 
begin 
	declare total int unsigned;

	select count(*) into total
	from tbl_factura_det
	where producto_id = productoid;
	
	return total;
end
select fn_contar_productos(2)
-- INSERTE UN NUEVO REGISTRO EN EL PRODUCTO CON STOCK 10


-- EJERCICIO 3: TRIGGERS -> disparadores


select * from tbl_producto
create trigger tg_producto_stock
before insert
on tbl_producto for each row 
begin 
	set new.producto_stock = 10;
end

insert into tbl_producto(producto_descripcion,producto_precio,
producto_estado,producto_fecha_log,producto_usuario_log)
values('HUAWEI P40 LITE',1000,'1',current_timestamp(),'ADMIN')





