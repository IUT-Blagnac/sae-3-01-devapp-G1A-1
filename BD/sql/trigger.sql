DELIMITER $$

-- Trigger pour Carte_AE
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

-- Trigger pour ACommande
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

-- Trigger pour Paypal
CREATE TRIGGER t_i_paypal_nbd
BEFORE INSERT ON Paypal
FOR EACH ROW
BEGIN
    DECLARE max_id INT;
    SELECT MAX(idCarte) INTO max_id FROM Paypal;
    SET NEW.idCarte = (COALESCE(max_id, 1) + 3);
END; $$

-- Trigger pour Carte_EU
CREATE TRIGGER t_i_carte_eu_nbd
BEFORE INSERT ON Carte_EU
FOR EACH ROW
BEGIN
    DECLARE max_id INT;
    SELECT MAX(idCarte) INTO max_id FROM Carte_EU;
    SET NEW.idCarte = (COALESCE(max_id, 2) + 3);
END; $$

-- Trigger pour Carte_AE
CREATE TRIGGER t_i_carte_ae_nbd 
BEFORE INSERT ON Carte_AE
FOR EACH ROW
BEGIN
    DECLARE max_id INT;
    SELECT MAX(idCarte) INTO max_id FROM Carte_AE;
    SET NEW.idCarte = (COALESCE(max_id, 3) + 3);
END; $$

DELIMITER ;


# faire que l'adresse email ne puisse pas être deux fois'
ALTER TABLE Client
ADD CONSTRAINT UNIQUE (email);

# A consulter faire que quand produit ou categ cliquer : insert ARegarde
INSERT INTO AConsulte (idNumCli, idNumProduit, dateConsultation) VALUES ((?), (?), CURRENT_DATE); 
