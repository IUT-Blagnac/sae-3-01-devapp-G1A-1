CREATE OR REPLACE TRIGGER trg_check_numCarte
BEFORE INSERT OR UPDATE ON Carte_AE
FOR EACH ROW
BEGIN
    IF :NEW.numCarte NOT LIKE '34%' AND :NEW.numCarte NOT LIKE '37%' THEN
        RAISE_APPLICATION_ERROR(-20001, 'numCarte doit commencer par "34" or "37".');
    END IF;
END;
/