drop database if exists Ferriplus;
create database Ferriplus;
use Ferriplus;
CREATE TABLE Tipo_de_Producto
(
    Tip_ID	INT auto_increment PRIMARY KEY,
    Tip_Nombre	VARCHAR(50)
);

INSERT INTO Tipo_de_Producto(Tip_ID, Tip_Nombre) VALUES ('1', 'Martillo');
INSERT INTO Tipo_de_Producto(Tip_ID, Tip_Nombre) VALUES ('2', 'Destornillador');
INSERT INTO Tipo_de_Producto(Tip_ID, Tip_Nombre) VALUES ('3', 'Fertilizante');
INSERT INTO Tipo_de_Producto(Tip_ID, Tip_Nombre) VALUES ('4', 'Maiz');
INSERT INTO Tipo_de_Producto(Tip_ID, Tip_Nombre) VALUES ('5', 'Herbicida');

CREATE TABLE Producto
(
    Pro_ID	INT auto_increment PRIMARY KEY,
    Pro_Nombre	VARCHAR(50),
    Tip_ID	INT,
    Pro_Vencimiento	date,
    Pro_tipo varchar(8)
);

INSERT INTO Producto (Pro_Nombre, Tip_ID, Pro_Vencimiento,Pro_tipo) VALUES ('Mazeta', '1', Null, 'Cantidad');
INSERT INTO Producto (Pro_Nombre, Tip_ID, Pro_Vencimiento,Pro_tipo) VALUES ('Martillo de carpinteria', '1', Null,'Cantidad');
INSERT INTO Producto (Pro_Nombre, Tip_ID, Pro_Vencimiento,Pro_tipo) VALUES ('Maritillo de goma', '1', Null,'Cantidad');
INSERT INTO Producto (Pro_Nombre, Tip_ID, Pro_Vencimiento,Pro_tipo) VALUES ('Destornillador de pala', '2', Null,'Cantidad');
INSERT INTO Producto (Pro_Nombre, Tip_ID, Pro_Vencimiento,Pro_tipo) VALUES ('Destornillador de estrella', '2', Null,'Cantidad');
INSERT INTO Producto (Pro_Nombre, Tip_ID, Pro_Vencimiento,Pro_tipo) VALUES ('Destronillador electrico', '2', Null,'Cantidad');
INSERT INTO Producto (Pro_Nombre, Tip_ID, Pro_Vencimiento,Pro_tipo) VALUES ('Fertilizante Pepito', '3', '2024-10-28','Cantidad');
INSERT INTO Producto (Pro_Nombre, Tip_ID, Pro_Vencimiento,Pro_tipo) VALUES ('Fertilizante Carlos', '3', '2024-9-5','Cantidad');
INSERT INTO Producto (Pro_Nombre, Tip_ID, Pro_Vencimiento,Pro_tipo) VALUES ('Maiz Entero', '4', Null, 'Gramaje');
INSERT INTO Producto (Pro_Nombre, Tip_ID, Pro_Vencimiento,Pro_tipo) VALUES ('Maiz Partido', '4', Null,'Gramaje');
INSERT INTO Producto (Pro_Nombre, Tip_ID, Pro_Vencimiento,Pro_tipo) VALUES ('Glifosfato al 50%', '5', '2024-6-7','Cantidad');
INSERT INTO Producto (Pro_Nombre, Tip_ID, Pro_Vencimiento,Pro_tipo) VALUES ('Glifosfato al 20%', '5', '2024-6-7','Cantidad');

CREATE TABLE Persona
(
    Per_ID	INT PRIMARY KEY,
    Per_Nombre	VARCHAR(30),
    Per_Apellido	VARCHAR(30),
    Per_Telefono	VARCHAR(15),
    Direccion	VARCHAR(50)
);

INSERT INTO Persona (Per_ID, Per_Nombre, Per_Apellido, Per_Telefono, Direccion) VALUES ('1000861156', 'Tania', 'Celis', Null, Null);
INSERT INTO Persona (Per_ID, Per_Nombre, Per_Apellido, Per_Telefono, Direccion) VALUES ('1000666867', 'Jose', 'Suarez', Null, Null);
INSERT INTO Persona (Per_ID, Per_Nombre, Per_Apellido, Per_Telefono, Direccion) VALUES ('1001327419', 'Luis', 'Perez', Null, Null);
INSERT INTO Persona (Per_ID, Per_Nombre, Per_Apellido, Per_Telefono, Direccion) VALUES ('1000347987', 'Fredy', 'Antonio', '3153542087', Null);
INSERT INTO Persona (Per_ID, Per_Nombre, Per_Apellido, Per_Telefono, Direccion) VALUES ('997657459', 'Andres', 'Hernandez', '3178958207', 'Carrera 4 # 32-7');

CREATE TABLE Empleado
(
    Per_ID	INT,
    Emp_PagoHora	INT,
    Emp_Entrada	VARCHAR(10),
    Emp_Salida	VARCHAR(10),
    Emp_Tipo	VARCHAR(20)
);

INSERT INTO Empleado (Per_ID, Emp_PagoHora, Emp_Entrada, Emp_Salida, Emp_Tipo) VALUES ('1000861156', 17000 , '5:00 AM', '10:00 PM', 'Admin');
INSERT INTO Empleado (Per_ID, Emp_PagoHora, Emp_Entrada, Emp_Salida, Emp_Tipo) VALUES ('1000666867', 12000, '6:00 AM', '2:00 PM', 'Regular');
INSERT INTO Empleado (Per_ID, Emp_PagoHora, Emp_Entrada, Emp_Salida, Emp_Tipo) VALUES ('1001327419', 12000, '2:00 PM', '10:00 PM', 'Regular');

CREATE TABLE Turno_Empleado 
(
    Per_ID	INT,
    Tur_fecha	date,
    Tur_Entrda	VARCHAR(10),
    Tur_Salida	VARCHAR(10),
    Tur_HorasTrabajo	INT,
    Tur_Ventas	INT
);

INSERT INTO Turno_Empleado (Per_ID, Tur_fecha, Tur_Entrda, Tur_Salida, Tur_HorasTrabajo, Tur_Ventas) VALUES ('1000861156', '2023-10-28', '5:15 AM', '10:15 PM', '17', '2');
INSERT INTO Turno_Empleado (Per_ID, Tur_fecha, Tur_Entrda, Tur_Salida, Tur_HorasTrabajo, Tur_Ventas) VALUES ('1000861156', '2023-10-27', '4:55 AM', '10:10 PM', '17', '0');
INSERT INTO Turno_Empleado (Per_ID, Tur_fecha, Tur_Entrda, Tur_Salida, Tur_HorasTrabajo, Tur_Ventas) VALUES ('1000666867', '2023-10-27', '6:50', '1:50 PM', '7', '3');
INSERT INTO Turno_Empleado (Per_ID, Tur_fecha, Tur_Entrda, Tur_Salida, Tur_HorasTrabajo, Tur_Ventas) VALUES ('1001327419', '2023-10-27', '2:00 PM', '9:30 PM', '8', '2');

CREATE TABLE Cliente 
(
    Per_ID	INT,
    Cli_compras	INT
);

INSERT INTO Cliente (Per_ID, Cli_compras) VALUES ('1000347987', '5');
INSERT INTO Cliente (Per_ID, Cli_compras) VALUES ('997657459', '2');

CREATE TABLE Empresa 
(
    Per_ID	INT PRIMARY KEY,
    Empr_NIT	VARCHAR(20),
    Empr_Nombre	VARCHAR(30)
);

INSERT INTO Empresa (Per_ID, Empr_NIT, Empr_Nombre) VALUES ('997657459', '179.19511.18-4', 'La esperanza del abuelo');

CREATE TABLE Domiciliario 
(
    Per_ID	INT,
    Dom_Vehiculo	VARCHAR(8)
);

INSERT INTO Domiciliario (Per_ID, Dom_Vehiculo) VALUES ('1001327419', 'MKU599');

CREATE TABLE Factura 
(
    Fac_id	INT auto_increment PRIMARY KEY,
    Fac_fecha	datetime,
    Fact_Precio	INT,
    Fac_TipoPago	VARCHAR(15),
    Empleado_Per_ID	INT,
    Cliente_Per_ID	INT
);

INSERT INTO Factura (Fac_fecha, Fact_Precio, Fac_TipoPago, Empleado_Per_ID, Cliente_Per_ID) VALUES ('2023-10-28 15:33:12', '54600', 'Efectivo', '1000861156', '1000347987');
INSERT INTO Factura (Fac_fecha, Fact_Precio, Fac_TipoPago, Empleado_Per_ID, Cliente_Per_ID) VALUES ('2023-10-28 18:15:33', '11000', 'Tarjeta', '1000861156', '997657459');
INSERT INTO Factura (Fac_fecha, Fact_Precio, Fac_TipoPago, Empleado_Per_ID, Cliente_Per_ID) VALUES ('2023-10-27 15:33:12', '125000', 'Efectivo', '1000666867', '1000347987');
INSERT INTO Factura (Fac_fecha, Fact_Precio, Fac_TipoPago, Empleado_Per_ID, Cliente_Per_ID) VALUES ('2023-10-27 08:51:27', '26900', 'Tarjeta', '1000666867', '997657459');
INSERT INTO Factura (Fac_fecha, Fact_Precio, Fac_TipoPago, Empleado_Per_ID, Cliente_Per_ID) VALUES ('2023-10-27 11:23:15', '95000', 'Tarjeta', '1000666867', '997657459');
INSERT INTO Factura (Fac_fecha, Fact_Precio, Fac_TipoPago, Empleado_Per_ID, Cliente_Per_ID) VALUES ('2023-10-27 17:05:57', '100000', 'Tarjeta', '1001327419', '997657459');
INSERT INTO Factura (Fac_fecha, Fact_Precio, Fac_TipoPago, Empleado_Per_ID, Cliente_Per_ID) VALUES ('2023-10-27 18:15:33', '34000', 'Tarjeta', '1001327419', '997657459');

CREATE TABLE Envio 
(
    Env_ID INT auto_increment PRIMARY KEY,
    Env_costo	INT,
    Env_FechaEntrega	VARCHAR(12),
    Fac_ID	INT,
    Cliente_Per_ID	INT,
    Domiciliarios_Per_ID	INT,
    Env_Direccion	VARCHAR(50)
);

INSERT INTO Envio (Env_ID, Env_costo, Env_FechaEntrega, Fac_ID, Cliente_Per_ID, Domiciliarios_Per_ID, Env_Direccion) VALUES ('1', '10000', '10/29/2023', '4', '997657459', '1001327419', 'Carrera 4 # 32-7');

CREATE TABLE Producto_has_factura 
(
    Fac_ID	INT,
    Pro_ID	INT,
    Ven_Fecha	datetime,
    Profa_Cantidad	INT,
    Profa_ValorToral	INT
);

INSERT INTO Producto_has_factura (Fac_ID, Pro_ID, Ven_Fecha, Profa_Cantidad, Profa_ValorToral) VALUES ('1', '2', '2023-10-28 15:33:12', '1', '14600');
INSERT INTO Producto_has_factura (Fac_ID, Pro_ID, Ven_Fecha, Profa_Cantidad, Profa_ValorToral) VALUES ('1', '12', '2023-10-28 15:33:12', '1', '40000');
INSERT INTO Producto_has_factura (Fac_ID, Pro_ID, Ven_Fecha, Profa_Cantidad, Profa_ValorToral) VALUES ('2', '9', '2023-10-28 18:15:33', '5', '11000');
INSERT INTO Producto_has_factura (Fac_ID, Pro_ID, Ven_Fecha, Profa_Cantidad, Profa_ValorToral) VALUES ('3', '12', '2023-10-27 15:33:12', '2', '40000');
INSERT INTO Producto_has_factura (Fac_ID, Pro_ID, Ven_Fecha, Profa_Cantidad, Profa_ValorToral) VALUES ('3', '7', '2023-10-27 15:33:12', '5', '85000');
INSERT INTO Producto_has_factura (Fac_ID, Pro_ID, Ven_Fecha, Profa_Cantidad, Profa_ValorToral) VALUES ('4', '1', '2023-10-27 08:51:27', '1', '26900');
INSERT INTO Producto_has_factura (Fac_ID, Pro_ID, Ven_Fecha, Profa_Cantidad, Profa_ValorToral) VALUES ('5', '6', '2023-10-27 11:23:15', '1', '95000');
INSERT INTO Producto_has_factura (Fac_ID, Pro_ID, Ven_Fecha, Profa_Cantidad, Profa_ValorToral) VALUES ('6', '12', '2023-10-27 17:05:57', '5', '100000');
INSERT INTO Producto_has_factura (Fac_ID, Pro_ID, Ven_Fecha, Profa_Cantidad, Profa_ValorToral) VALUES ('7', '7', '2023-10-27 18:15:33', '2', '34000');

CREATE TABLE Proovedor 
(
    Prov_NIT	VARCHAR(20) PRIMARY KEY,
    Prov_RazonSocial	VARCHAR(50),
    Prov_Telefono	VARCHAR(15),
    Prov_Ciudad	VARCHAR(30),
    Prov_Direccion	VARCHAR(50),
    Prov_Num_Ordenes	INT,
    Prov_Dineros	INT
);

INSERT INTO Proovedor (Prov_NIT, Prov_RazonSocial, Prov_Telefono, Prov_Ciudad, Prov_Direccion, Prov_Num_Ordenes, Prov_Dineros) VALUES ('108.66784.33-8', 'Logistica Ferretera S A S', '6013417725', 'Bogota', 'CARRERA 16 12 50', '2', '700000 ');
INSERT INTO Proovedor (Prov_NIT, Prov_RazonSocial, Prov_Telefono, Prov_Ciudad, Prov_Direccion, Prov_Num_Ordenes, Prov_Dineros) VALUES ('198.55064.32-4', 'Italcol', '(571) 4221360', 'Funza', 'Km. 13 Via occidente Funza', '3', '1000000');

CREATE TABLE Gramaje 
(
    Pro_ID	INT,
    Gra_PesoMinimo	INT,
    Gra_PrecioPeso	INT,
    Gra_PrecioCompra INT,
    Gra_PesoDescuento	INT,
    Gra_Descuento	DOUBLE,
    Gra_StockGramos	double
);

INSERT INTO Gramaje (Pro_ID, Gra_PesoMinimo, Gra_PrecioPeso, Gra_PrecioCompra, Gra_PesoDescuento, Gra_Descuento, Gra_StockGramos) VALUES ('9', '1', '2200', 1900, '150', '0.1', '57');
INSERT INTO Gramaje (Pro_ID, Gra_PesoMinimo, Gra_PrecioPeso, Gra_PrecioCompra, Gra_PesoDescuento, Gra_Descuento, Gra_StockGramos) VALUES ('10', '1', '2500', 2000, '150', '0.1', '32');

CREATE TABLE Cantidad 
(
    Pro_ID	INT,
    can_PrecioUnidad	INT,
    can_PrecioCompra INT,
    can_CantidadporMayor	INT,
    can_descuentoMayor	DOUBLE,
    can_PrecioMayor	INT,
    canStockUnidades	INT
);

INSERT INTO Cantidad (Pro_ID, can_PrecioUnidad, can_PrecioCompra, can_CantidadporMayor, can_descuentoMayor, can_PrecioMayor, canStockUnidades) VALUES ('1', '26900', '25000', '20', '0.02', '26362', '8');
INSERT INTO Cantidad (Pro_ID, can_PrecioUnidad, can_PrecioCompra, can_CantidadporMayor, can_descuentoMayor, can_PrecioMayor, canStockUnidades) VALUES ('2', '14600', '12000', '30', '0.02', '14308', '15');
INSERT INTO Cantidad (Pro_ID, can_PrecioUnidad, can_PrecioCompra, can_CantidadporMayor, can_descuentoMayor, can_PrecioMayor, canStockUnidades) VALUES ('3', '12900', '10000', '20', '0.02', '12642', '3');
INSERT INTO Cantidad (Pro_ID, can_PrecioUnidad, can_PrecioCompra, can_CantidadporMayor, can_descuentoMayor, can_PrecioMayor, canStockUnidades) VALUES ('4', '19900', '15000', '40', '0.02', '19502', '10');
INSERT INTO Cantidad (Pro_ID, can_PrecioUnidad, can_PrecioCompra, can_CantidadporMayor, can_descuentoMayor, can_PrecioMayor, canStockUnidades) VALUES ('5', '19900', '16000', '40', '0.02', '19502', '8');
INSERT INTO Cantidad (Pro_ID, can_PrecioUnidad, can_PrecioCompra, can_CantidadporMayor, can_descuentoMayor, can_PrecioMayor, canStockUnidades) VALUES ('6', '95000', '80000', '100', '0.05', '90250', '5');
INSERT INTO Cantidad (Pro_ID, can_PrecioUnidad, can_PrecioCompra, can_CantidadporMayor, can_descuentoMayor, can_PrecioMayor, canStockUnidades) VALUES ('7', '17000', '13000', '100', '0.05', '16150', '20');
INSERT INTO Cantidad (Pro_ID, can_PrecioUnidad, can_PrecioCompra, can_CantidadporMayor, can_descuentoMayor, can_PrecioMayor, canStockUnidades) VALUES ('8', '13900', '11000', '100', '0.05', '13205', '16');
INSERT INTO Cantidad (Pro_ID, can_PrecioUnidad, can_PrecioCompra, can_CantidadporMayor, can_descuentoMayor, can_PrecioMayor, canStockUnidades) VALUES ('11', '50000', '45000', '50', '0.04', '48000', '2');
INSERT INTO Cantidad (Pro_ID, can_PrecioUnidad, can_PrecioCompra, can_CantidadporMayor, can_descuentoMayor, can_PrecioMayor, canStockUnidades) VALUES ('12', '40000', '36000', '50', '0.04', '38400', '8');

CREATE TABLE Venta_Historico 
(
    Pro_ID	INT,
    Ven_Fecha	date,
    Ven_CostoHistorico	INT
);

INSERT INTO Venta_Historico (Pro_ID, Ven_Fecha, Ven_CostoHistorico) VALUES ('2', '2023-10-28', '14600');
INSERT INTO Venta_Historico (Pro_ID, Ven_Fecha, Ven_CostoHistorico) VALUES ('12', '2023-10-28', '40000');
INSERT INTO Venta_Historico (Pro_ID, Ven_Fecha, Ven_CostoHistorico) VALUES ('9', '2023-10-27', '2200');
INSERT INTO Venta_Historico (Pro_ID, Ven_Fecha, Ven_CostoHistorico) VALUES ('12', '2023-10-27', '20000');
INSERT INTO Venta_Historico (Pro_ID, Ven_Fecha, Ven_CostoHistorico) VALUES ('1', '2023-10-27', '26900');
INSERT INTO Venta_Historico (Pro_ID, Ven_Fecha, Ven_CostoHistorico) VALUES ('6', '2023-10-27', '95000');
INSERT INTO Venta_Historico (Pro_ID, Ven_Fecha, Ven_CostoHistorico) VALUES ('7', '2023-10-27', '17000');

CREATE TABLE Compra_Historico 
(
    Pro_ID	INT,
    Com_Fecha	date,
    Com_Costo	INT
);

INSERT INTO Compra_Historico (Pro_ID, Com_Fecha, Com_Costo) VALUES ('3', '2023-10-27', '11000');
INSERT INTO Compra_Historico (Pro_ID, Com_Fecha, Com_Costo) VALUES ('4', '2023-10-27', '17000');
INSERT INTO Compra_Historico (Pro_ID, Com_Fecha, Com_Costo) VALUES ('10', '2023-10-27', '2000');
INSERT INTO Compra_Historico (Pro_ID, Com_Fecha, Com_Costo) VALUES ('9', '2023-10-28', '2200');
INSERT INTO Compra_Historico (Pro_ID, Com_Fecha, Com_Costo) VALUES ('4', '2023-10-28', '17300');
INSERT INTO Compra_Historico (Pro_ID, Com_Fecha, Com_Costo) VALUES ('11', '2023-10-05', '20000');

CREATE TABLE Pedido 
(
    Ped_ID	INT auto_increment PRIMARY KEY,
    Ped_fecha	datetime,
    Ped_Valor	INT,
    Prov_ID	VARCHAR(20)
);

INSERT INTO Pedido (Ped_fecha, Ped_Valor, Prov_ID) VALUES ( '2023-10-2 06:09:15', '30000', '108.66784.33-8');
INSERT INTO Pedido (Ped_fecha, Ped_Valor, Prov_ID) VALUES ( '2023-10-28 06:09:15', '19500', '198.55064.32-4');
INSERT INTO Pedido (Ped_fecha, Ped_Valor, Prov_ID) VALUES ( '2023-10-05 06:09:15', '20000', '108.66784.33-8');

CREATE TABLE Producto_has_Pedido 
(
    Ped_ID	INT,
    Com_Pro_ID	INT,
    Com_Fecha	datetime,
    Prope_Cantidad	INT,
    Prope_valorProductos	INT
);

INSERT INTO Producto_has_Pedido (Ped_ID, Com_Pro_ID, Com_Fecha, Prope_Cantidad, Prope_valorProductos) VALUES ('1', '3', '2023-10-2 06:09:15', '10', '11000');
INSERT INTO Producto_has_Pedido (Ped_ID, Com_Pro_ID, Com_Fecha, Prope_Cantidad, Prope_valorProductos) VALUES ('1', '4', '2023-10-2 06:09:15', '20', '17000');
INSERT INTO Producto_has_Pedido (Ped_ID, Com_Pro_ID, Com_Fecha, Prope_Cantidad, Prope_valorProductos) VALUES ('1', '10', '2023-10-2 06:09:15', '20', '2000');
INSERT INTO Producto_has_Pedido (Ped_ID, Com_Pro_ID, Com_Fecha, Prope_Cantidad, Prope_valorProductos) VALUES ('2', '9', '2023-10-28 06:09:15', '30', '2200');
INSERT INTO Producto_has_Pedido (Ped_ID, Com_Pro_ID, Com_Fecha, Prope_Cantidad, Prope_valorProductos) VALUES ('2', '4', '2023-10-28 06:09:15', '20', '17300');
INSERT INTO Producto_has_Pedido (Ped_ID, Com_Pro_ID, Com_Fecha, Prope_Cantidad, Prope_valorProductos) VALUES ('3', '11', '2023-10-05 06:09:15', '50', '20000');
