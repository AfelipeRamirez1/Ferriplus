use ferriplus;

select * from factura;

select Pro_Nombre,sum(Profa_Cantidad) from producto natural join producto_has_factura group by Pro_Nombre order by sum(Profa_Cantidad) desc limit 1;
drop procedure if exists ventas_dia;
DELIMITER $$
CREATE PROCEDURE ventas_dia(dia date)
BEGIN
select count(Fac_id), sum(Fact_Precio) from factura where Fac_fecha = dia;
END $$
DELIMITER ;
drop procedure if exists pagos_dia;
DELIMITER $$
CREATE PROCEDURE pagos_dia(dia date)
BEGIN
select Per_Nombre, Per_Apellido, Tur_HorasTrabajo, Emp_PagoHora*Tur_HorasTrabajo
from empleado natural join persona natural join turno_empleado where Tur_fecha = dia;
END $$
DELIMITER ;
drop procedure if exists crear_ventaHistorica;
DELIMITER $$
CREATE PROCEDURE crear_ventaHistorica(prod_id int)
BEGIN
	declare precio_actual int;
	select coalesce(can_PrecioUnidad,Gra_PrecioPeso)
	 from producto natural left join cantidad natural left join gramaje where Pro_id = prod_id into precio_actual;
	if not exists (select * from venta_historico where Pro_id = prod_id and Ven_fecha = curdate()) then
		insert into venta_historico values (prod_id, now(), precio_actual);
	end if;
END $$
DELIMITER ;
drop procedure if exists crear_factura;
DELIMITER $$
CREATE PROCEDURE crear_factura(metodo varchar(15),cliente int, empleado int,productos varchar(512), cantidades varchar(512))
BEGIN
declare facturaa int;
declare fecha_hora datetime;
set fecha_hora = now();
insert into factura (Fac_fecha, Fact_Precio, Fac_TipoPago, Empleado_Per_ID, Cliente_Per_ID) values (fecha_hora, 0, metodo, empleado, cliente);
select max(Fac_id) from factura into facturaa;
call addProductos(productos, cantidades, facturaa, fecha_hora);
update factura set Fact_Precio = (select sum(Profa_ValorToral) from producto_has_factura group by Fac_ID having Fac_ID = facturaa) where Fac_id = facturaa;
END $$
DELIMITER ;
drop procedure if exists addProductos;
DELIMITER $$
CREATE PROCEDURE addProductos(IN array1 VARCHAR(512), IN array2 VARCHAR(512), IN Factura int, IN hora datetime)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE value1 INT;
    DECLARE value2 INT;
    declare costo int;
    -- Create a temporary table to store the data
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_table (
        factura int,
        value1 INT,
        hora datetime,
        value2 INT,
        costo int
    );
    -- Loop through the arrays and insert data into the temporary table
    WHILE i <= (Length(array1) - Length(REPLACE(array1, ',', '')))+1 DO
        SET value1 = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(array1, ',', i), ',', -1) AS SIGNED);
        call crear_ventaHistorica(value1);
        SET value2 = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(array2, ',', i), ',', -1) AS SIGNED);
        set costo = (select Ven_CostoHistorico from venta_historico where Pro_ID = value1 and Ven_Fecha = curdate())*value2;
        INSERT INTO temp_table VALUES (Factura, value1, hora, value2, costo);
        SET i = i + 1;
    END WHILE;
    -- Select the data from the temporary table
    -- select * from temp_table;
    insert into producto_has_factura SELECT * FROM temp_table;
    -- Drop the temporary table when done
    DROP TEMPORARY TABLE IF EXISTS temp_table;
END $$
DELIMITER ;
drop procedure if exists crear_compraHistorica;
DELIMITER $$
CREATE PROCEDURE crear_compraHistorica(prod_id int)
BEGIN
	declare precio_actual int;
	select coalesce(can_PrecioCompra,Gra_PrecioCompra)
	 from producto natural left join cantidad natural left join gramaje where Pro_id = prod_id into precio_actual;
	if not exists (select * from compra_historico where Pro_ID = prod_id and Com_fecha = curdate()) then
		insert into compra_historico values (prod_id, now(), precio_actual);
	end if;
END $$
DELIMITER ;
drop procedure if exists crear_pedido;
DELIMITER $$
CREATE PROCEDURE crear_pedido(proovedor varchar(20), productos varchar(512), cantidades varchar(512))
BEGIN
declare pedidoo int;
declare fecha_hora datetime;
set fecha_hora = now();
insert into pedido (Ped_fecha, Ped_Valor, Prov_ID) values (fecha_hora, 0, proovedor);
select max(Ped_ID) from pedido into pedidoo;
call addProductos2(productos, cantidades, pedidoo, fecha_hora);
update pedido set Ped_Valor = (select sum(Prope_valorProductos) from producto_has_pedido group by Ped_ID having Ped_ID = pedidoo) where Ped_ID = pedidoo;
END $$
DELIMITER ;
drop procedure if exists addProductos2;
DELIMITER $$
CREATE PROCEDURE addProductos2(IN array1 VARCHAR(512), IN array2 VARCHAR(512), IN Pedido int, IN hora datetime)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE value1 INT;
    DECLARE value2 INT;
    declare costo int;
    -- Create a temporary table to store the data
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_table (
        pedido int,
        value1 INT,
        hora datetime,
        value2 INT,
        costo int
    );
    -- Loop through the arrays and insert data into the temporary table
    WHILE i <= (Length(array1) - Length(REPLACE(array1, ',', '')))+1 DO
        SET value1 = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(array1, ',', i), ',', -1) AS SIGNED);
        call crear_compraHistorica(value1);
        SET value2 = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(array2, ',', i), ',', -1) AS SIGNED);
        set costo = (select Com_Costo from compra_historico where Pro_ID = value1 and Com_Fecha = curdate())*value2;
        INSERT INTO temp_table VALUES (Pedido, value1, hora, value2, costo);
        SET i = i + 1;
    END WHILE;
    -- Select the data from the temporary table
    -- select * from temp_table;
    insert into producto_has_pedido SELECT * FROM temp_table;
    -- Drop the temporary table when done
    DROP TEMPORARY TABLE IF EXISTS temp_table;
END $$
DELIMITER ;
select CAST(SUBSTRING_INDEX(SUBSTRING_INDEX('1,2,3', ',', 3), ',', -1) AS SIGNED);
call ventas_dia("10/28/2023");
call pagos_dia("10/27/2023");
call crear_ventaHistorica(1);
select * from venta_historico;
call crear_factura('Efectivo',1000861156,1000347987,'1,2,3','1,1,3');
select * from factura;
select * from venta_historico;
select * from producto_has_factura;
call crear_pedido('108.66784.33-8','1,2,3','80,10,30');
select * from pedido;
select * from compra_historico;
select * from producto_has_pedido;

call crear_compraHistorica(4);