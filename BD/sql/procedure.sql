DELIMITER $$

CREATE PROCEDURE NouvelleCommande (p_idNumCli INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        DECLARE msg VARCHAR(255);
        GET DIAGNOSTICS CONDITION 1 msg = MESSAGE_TEXT;
        SELECT CONCAT('Erreur : ', msg);
    END;

    UPDATE Commande
    SET panierActuel = FALSE
    WHERE idNumCli = p_idNumCli AND panierActuel = TRUE;

    INSERT INTO Commande (idNumCli, panierActuel) VALUES (p_idNumCli, TRUE);
    
END $$

-- pros enlever qte 
CREATE PROCEDURE EnleverQte (p_idNumCli INT, qteAchat INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        DECLARE msg VARCHAR(255);
        GET DIAGNOSTICS CONDITION 1 msg = MESSAGE_TEXT;
        SELECT CONCAT('Erreur : ', msg);
    END;

    UPDATE Produit
    SET qte = qte - qteAchat
    WHERE idNumCli = p_idNumCli AND panierActuel = TRUE;
    
END $$
DELIMITER ;
