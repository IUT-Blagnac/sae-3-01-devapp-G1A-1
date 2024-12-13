DROP PROCEDURE ValiderCommande;
DELIMITER $$

CREATE PROCEDURE ValiderCommande (IN p_idNumCli INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erreur : Une erreur est survenue lors de la validation de la commande.';
    END;

    START TRANSACTION;

    UPDATE Commande
    SET estPanierActuel  = 0,
        dateCommande = NOW()
    WHERE idNumCli = p_idNumCli 
    AND panierActuel = 1;

    INSERT INTO Commande (idNumCli, panierActuel) VALUES (p_idNumCli, TRUE);

    COMMIT;
END $$

DELIMITER ;

