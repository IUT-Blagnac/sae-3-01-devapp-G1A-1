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

DELIMITER $$

CREATE TRIGGER t_iu_acommade_maj_nbd
BEFORE INSERT ON ACommande
FOR EACH ROW
BEGIN
    DECLARE existing_qte INT;

    SELECT qte INTO existing_qte
    FROM ACommande
    WHERE idCommande = :NEW.idCommande AND idNumProduit = :NEW.idNumProduit
    LIMIT 1;

    IF existing_qte IS NOT NULL THEN
        UPDATE ACommande
        SET qte = existing_qte + :NEW.qte
        WHERE idCommande = :NEW.idCommande AND idNumProduit = :NEW.idNumProduit;
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Quantité mise à jour pour le produit existant dans la commande.';
    END IF;

END;
$$

DELIMITER ;



# faire que l'adresse email ne puisse pas être deux fois'
ALTER TABLE Client
ADD CONSTRAINT UNIQUE (email);

# A consulter faire que quand produit ou categ cliquer : insert ARegarde
INSERT INTO AConsulte (idNumCli, idNumProduit, dateConsultation) VALUES ((?), (?), CURRENT_DATE); 
