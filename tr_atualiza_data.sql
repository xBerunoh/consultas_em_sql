DELIMITER $$
CREATE TRIGGER tr_atualiza_data
BEFORE UPDATE ON funcionarios
FOR EACH ROW
BEGIN 
IF NEW.nome <> OLD.nome THEN
SET NEW.updated_at = current_date();
END IF;
END$$
DELIMITER ;