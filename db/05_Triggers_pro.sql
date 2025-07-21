use ferriplus;
drop trigger if exists tr_venta;
DELIMITER $$
CREATE TRIGGER tr_venta before insert on producto_has_factura 
FOR EACH ROW
BEGIN 
	DECLARE verificacion INT;
    declare cantidad_disponible int;
    SELECT COUNT(*) INTO verificacion FROM gramaje where gramaje.Pro_ID = new.Pro_ID;
    IF verificacion>= 1 then 
    select Gra_stockGramos into cantidad_disponible from gramaje where gramaje.Pro_ID = new.Pro_ID;
    IF cantidad_disponible - new.Profa_Cantidad<0 then 
    signal sqlstate '45000' set message_text = 'La cantidad supera el stock disponible';
    else
    update gramaje set Gra_StockGramos = Gra_StockGramos - new.Profa_Cantidad where gramaje.Pro_ID = new.Pro_ID;
    end if;
    else
     select canStockUnidades into cantidad_disponible from cantidad where cantidad.Pro_ID = new.Pro_ID;
     IF cantidad_disponible - new.Profa_Cantidad<0 then 
     signal sqlstate '45000' set message_text = 'La cantidad supera el stock disponible';
    else
    update cantidad set canStockUnidades = canStockUnidades - new.Profa_Cantidad where cantidad.Pro_ID = new.Pro_ID;
     end if;
    end if;
END $$
DELIMITER ;
drop trigger if exists tr_compra;
DELIMITER $$ 
create trigger tr_compra before insert on producto_has_pedido
FOR EACH ROW 
BEGIN
	DECLARE verificacion INT;
    SELECT COUNT(*) INTO verificacion FROM gramaje where gramaje.Pro_ID = new.Com_Pro_ID;
    IF verificacion>= 1 then 
	update gramaje set Gra_StockGramos = Gra_StockGramos + new.Prope_Cantidad where gramaje.Pro_ID = new.Com_Pro_ID;
    else
    update cantidad set canStockUnidades = canStockUnidades + new.Prope_Cantidad where cantidad.Pro_ID = new.Com_Pro_ID;
    end if;
END $$
DELIMITER ;
DROP TRIGGER IF EXISTS tr_add_compra_us;
DELIMITER $$

CREATE TRIGGER tr_add_compra_us AFTER INSERT ON factura
	FOR EACH ROW
    BEGIN 
    UPDATE cliente set Cli_compras = Cli_compras +1 where Per_ID = new.Cliente_Per_ID;
    END;
$$
DELIMITER ;
DROP TRIGGER IF EXISTS tr_add_pedido_prov;
DELIMITER $$

CREATE TRIGGER tr_add_pedido_prov AFTER INSERT ON pedido
	FOR EACH ROW
    BEGIN 
    UPDATE proovedor set Prov_Num_Ordenes = Prov_Num_Ordenes +1, Prov_Dineros = Prov_Dineros+new.Ped_Valor where Prov_NIT like new. Prov_ID;
    END;
$$
DELIMITER ;
