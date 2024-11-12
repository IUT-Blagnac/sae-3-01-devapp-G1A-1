SET serveroutput ON;
create or replace PROCEDURE NouvelleCommande 
    (p_idNumCli COMMANDE.idNumCli%TYPE) IS

enfant_sans_parent EXCEPTION;
PRAGMA EXCEPTION_INIT(enfant_sans_parent, -2291);
erreur_ck EXCEPTION;
PRAGMA EXCEPTION_INIT(erreur_ck, -2290);

BEGIN 

    UPDATE Commande
    SET panierActuel = FALSE
    WHERE idNumCli = p_idNumCli
    AND panierActuel = TRUE

    INSERT INTO Commande (idCommande, idNumCli, panierActuel)VALUES (seq_id_commande.NEXTVAL, p_idNumCli, TRUE);

EXCEPTION

    WHEN NO_DATA_FOUND THEN 
         DBMS_OUTPUT.PUT_LINE('Erreur : Client inconnue');
    WHEN enfant_sans_parent THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : enfant sans parent');
    DBMS_OUTPUT.PUT_LINE(SQLCODE || SQLERRM);

END;
/