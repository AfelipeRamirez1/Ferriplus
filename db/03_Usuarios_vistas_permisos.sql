use Ferriplus;

create view Vw_Gramaje as select  Tip_nombre,Pro_Nombre,Pro_Vencimiento,Gra_PrecioPeso,Gra_PesoDescuento,Gra_Descuento,Gra_StockGramos 
from producto join gramaje on producto.Pro_ID = gramaje.Pro_ID join tipo_de_producto on 
tipo_de_producto.Tip_ID = producto.Tip_ID;

create view Vw_Cantidad as select Tip_Nombre,Pro_Nombre,canStockUnidades,can_PrecioUnidad,can_CantidadporMayor,can_PrecioMayor from 
producto  join cantidad on producto.Pro_ID = cantidad.Pro_ID join tipo_de_producto on tipo_de_producto.Tip_ID = producto.Tip_ID;

create view facturasFredy as 
select factura.Fac_id,Pro_Nombre,Profa_Cantidad,Profa_ValorToral,Fact_Precio,Fac_TipoPago,persona.Per_Nombre as Empleado from 
producto_has_factura join factura on factura.Fac_id = producto_has_factura.Fac_ID join producto on 
producto_has_factura.Pro_ID = producto.Pro_ID join persona on factura.Empleado_Per_ID = persona.Per_ID where Cliente_Per_ID = 1000347987 order by Fac_id;

create view facturasAndres as 
select factura.Fac_id,Pro_Nombre,Profa_Cantidad,Profa_ValorToral,Fact_Precio,Fac_TipoPago,persona.Per_Nombre as Empleado from 
producto_has_factura join factura on factura.Fac_id = producto_has_factura.Fac_ID join producto on 
producto_has_factura.Pro_ID = producto.Pro_ID join persona on factura.Empleado_Per_ID = persona.Per_ID where Cliente_Per_ID = 997657459 order by Fac_id;

create view enviosFredy as select Env_ID,Env_costo,Env_FechaEntrega,Env_Direccion,Per_Nombre as Empleado from envio join 
persona on Domiciliarios_Per_ID = Per_ID where Cliente_Per_ID = 1000347987 ;

create view enviosAndres as select Env_ID,Env_costo,Env_FechaEntrega,Env_Direccion,Per_Nombre as Empleado from envio join 
persona on Domiciliarios_Per_ID = Per_ID where Cliente_Per_ID = 997657459 ;

create view infoFredy as select Per_nombre,Per_Apellido,persona.Per_ID,Per_Telefono,Direccion,Cli_compras from cliente  join persona on persona.Per_ID = 
cliente.Per_ID where persona.Per_nombre ='Fredy';
create view empresaAndres as select * from empresa ;
create view infoAndres as select Per_nombre,Per_Apellido,persona.Per_ID,Per_Telefono,Direccion,Cli_compras from cliente  join persona
 on persona.Per_ID = cliente.Per_ID where persona.Per_nombre ='Andres';
create role cliente;
create role empleado;
create role administrador;
grant select on Vw_Gramaje to cliente; 
grant select on Vw_cantidad to cliente;
create user 'Fredy'@'localhost' identified by '';
grant cliente to 'Fredy'@'localhost';
grant select on persona to 'Fredy'@'localhost';
grant select on cliente to 'Fredy'@'localhost';
grant select on infoFredy to 'Fredy'@'localhost';
grant select on facturasFredy to 'Fredy'@'localhost';
grant select on enviosFredy to 'Fredy'@'localhost';
create user 'Andres'@'localhost' identified by '';
grant cliente to 'Andres'@'localhost';
grant select on persona to 'Andres'@'localhost';
grant select on cliente to 'Andres'@'localhost';
grant select on infoAndres to 'Andres'@'localhost';
grant select on facturasAndres to 'Andres'@'localhost';
grant select on enviosAndres to 'Andres'@'localhost';
grant select on factura to cliente;
create user 'administrador'@'localhost' identified by'administrador';
grant administrador to 'administrador'@'localhost';
grant insert,select,update,delete on ferriplus.* to administrador;
create user 'empleado'@'localhost' identified by'regular';
grant empleado to 'empleado'@'localhost';
grant select,update,delete on gramaje  to empleado;
grant select,update,delete on cantidad  to empleado;
grant insert,select,update,delete on cliente  to empleado;
grant insert,select,update,delete on persona  to empleado;
grant insert,select,update,delete on empresa  to empleado;
grant insert,select,update on envio  to empleado;
grant insert,select,update on factura  to empleado;
grant select,update on turno_empleado to empleado;
grant select,update on domiciliario  to empleado;
grant select,update,delete on producto  to empleado;
grant select,update,delete on tipo_de_producto  to empleado;
grant insert,select,update on compra_historico  to empleado;
grant select on pedido  to empleado;
grant select on proovedor  to empleado;
grant select on empleado to empleado;
create user 'Jose'@'localhost' identified by 'empleado';
create user 'Luis'@'localhost' identified by 'empleado';
create user 'Tania'@'localhost' identified by 'administrador';
grant select on Vw_Gramaje to empleado; 
grant select on Vw_cantidad to empleado;
grant update on persona to cliente;
grant empleado to 'Jose'@'localhost';
grant empleado to 'Luis'@'localhost';
grant administrador to 'Tania'@'localhost';
set default role all to 'Fredy'@'localhost','Andres'@'localhost','Jose'@'localhost','Luis'@'localhost','Tania'@'localhost';
flush privileges;








