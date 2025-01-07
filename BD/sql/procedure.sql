DROP PROCEDURE IF EXISTS ValiderCommande;
DELIMITER $$

CREATE PROCEDURE ValiderCommande(IN p_idNumCli INT)
BEGIN
    DECLARE v_idAdresse INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    SELECT idAdresse INTO v_idAdresse
    FROM Client
    WHERE idNumCli = p_idNumCli;

    IF v_idAdresse IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Aucune adresse associée à ce client.';
    END IF;

    UPDATE Commande
    SET estPanierActuel = FALSE,
        dateCommande = NOW(),
        idAdresse = v_idAdresse
    WHERE idNumCli = p_idNumCli
      AND estPanierActuel = TRUE;

    INSERT INTO Commande (idNumCli, estPanierActuel) VALUES (p_idNumCli, TRUE);

    COMMIT;
END $$

DELIMITER ;

DROP PROCEDURE IF EXISTS ValiderCommandeChangementAdresse;
DELIMITER $$

CREATE PROCEDURE ValiderCommandeChangementAdresse (
    IN p_idNumCli INT,
    IN p_pays VARCHAR(255),
    IN p_ville VARCHAR(255),
    IN p_numNomRue VARCHAR(255),
    IN p_codePostal VARCHAR(20)
)
BEGIN
    DECLARE v_idAdresse INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal)
    VALUES (p_pays, p_ville, p_numNomRue, p_codePostal);

    SET v_idAdresse = LAST_INSERT_ID();

    IF NOT EXISTS (
        SELECT 1
        FROM Commande
        WHERE idNumCli = p_idNumCli AND estPanierActuel = TRUE
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Aucune commande en cours pour ce client.';
    END IF;

    UPDATE Commande
    SET estPanierActuel = FALSE,
        dateCommande = NOW(),
        idAdresse = v_idAdresse
    WHERE idNumCli = p_idNumCli
      AND estPanierActuel = TRUE;

    INSERT INTO Commande (idNumCli, estPanierActuel)
    VALUES (p_idNumCli, TRUE);

    COMMIT;
END $$

DELIMITER ;

DROP PROCEDURE IF EXISTS InsertAdressePostale;
DELIMITER $$

CREATE PROCEDURE InsertAdressePostale (
    IN p_pays VARCHAR,
    IN p_ville VARCHAR,
    IN p_numNomRue VARCHAR,
    IN p_codePostal VARCHAR
)
BEGIN
    INSERT INTO AdressePostale (pays, ville, numNomRue, codePostal) VALUES (p_pays, p_ville, p_numNomRue, p_codePostal);
END$$

DELIMITER ;


