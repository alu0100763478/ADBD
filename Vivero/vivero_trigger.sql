CREATE FUNCTION pedido_nuevo() RETURNS trigger AS $pedido_nuevo$
    BEGIN
        UPDATE Producto SET stock=Producto.stock-NEW.cantidad WHERE cod_prod=NEW.cod_prod;
        RAISE NOTICE 'HOLA';
        RETURN NULL;
    END;
$pedido_nuevo$ LANGUAGE plpgsql;

CREATE TRIGGER pedido_nuevo BEFORE INSERT ON Pedido_Producto
  FOR EACH ROW EXECUTE PROCEDURE pedido_nuevo();
