CREATE OR REPLACE FUNCTION clientes()
    RETURNS TRIGGER
    SET SCHEMA 'public'
    LANGUAGE plpgsql
    AS $$
    BEGIN
    IF ( LENGTH(NEW.DNI)= 0 ) THEN
        RAISE EXCEPTION 'No puede haber nulos.';
    END IF;
 
    IF ((POSITION(' ' IN NEW.DNI) > 0 )THEN
        RAISE EXCEPTION 'No puede haber espacios.';
    END IF;
    
    CREATE TRIGGER clientes 
    BEFORE INSERT OR UPDATE ON Clientes
    FOR EACH ROW EXECUTE PROCEDURE clientes();
