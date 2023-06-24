-- como crear una vista
create or replace view v_factura
as 
	select factura_cab_serie,factura_cab_nro,
	factura_cab_femision,factura_cab_tipo_moneda,
	factura_cab_valortotal from tbl_factura_cab

select * from v_factura

-- un reporte la serie el numero la fecha de la venta su codigo 
-- del cliente con el nombre del cliente la moneda y el total, 
-- y el stock el nombre del producto

create or replace view v_rfactura
as
select fc.factura_cab_serie numero_serie,fc.factura_cab_femision fecha,
tc.cliente_rsocial cliente,fc.factura_cab_tipo_moneda tipo_moneda,
tp.producto_descripcion producto,tp.producto_stock stock,
fc.factura_cab_valortotal total
from tbl_factura_cab fc 
inner join tbl_cliente tc on fc.cliente_id  = tc.cliente_id
inner join tbl_factura_det fd on fc.factura_cab_id  = fd.factura_cab_id  
inner join tbl_producto tp on fd.producto_id  = tp.producto_id 

select * from v_rfactura

select * from tbl_factura_cab tfc 
select * from tbl_factura_det
select * from tbl_cliente 