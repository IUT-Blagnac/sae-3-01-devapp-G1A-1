DROP PROCEDURE IF EXISTS ValiderCommande;
DELIMITER $$

CREATE PROCEDURE ValiderCommande(IN p_idNumCli INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    UPDATE Commande
    SET estPanierActuel = FALSE,
        dateCommande = NOW()
    WHERE idNumCli = p_idNumCli
      AND estPanierActuel = TRUE;

    INSERT INTO Commande (idNumCli, estPanierActuel)
    VALUES (p_idNumCli, TRUE);

    COMMIT;
END $$

DELIMITER ;


