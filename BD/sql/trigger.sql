DELIMITER $$

CREATE TRIGGER t_iu_carte_AE_maj_nbd
BEFORE INSERT OR UPDATE ON Carte_AE
FOR EACH ROW
BEGIN
    IF :NEW.numCarte NOT LIKE '34%' AND :NEW.numCarte NOT LIKE '37%' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'numCarte doit commencer par "34" ou "37".';
    END IF;
END;
$$

DELIMITER ;


# faire que l'adresse email ne puisse pas être deux fois'
ALTER TABLE Client
ADD CONSTRAINT UNIQUE (email);

# A consulter faire que quand produit ou categ cliquer : insert ARegarde
INSERT INTO AConsulte (idNumCli, idNumProduit, dateConsultation) VALUES ((?), (?), CURRENT_DATE); 
