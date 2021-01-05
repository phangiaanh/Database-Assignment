-- count number of stores of an enterprise
-- USE Assignment;
-- DROP PROCEDURE IF EXISTS getStoreNumber;

DELIMITER $$
CREATE PROCEDURE getStoreNumber (IN id INT)
BEGIN
	IF NOT EXISTS(SELECT * FROM Enterprise WHERE Enterprise.Enterprise_ID = id) THEN SELECT 'ID is not valid' as '';
    ELSE SELECT COUNT(*) FROM Store WHERE Store.Store_Enterprise = id; 
    END IF;
END; $$





-- count number of active stores
-- USE Assignment;
-- DROP PROCEDURE IF EXISTS getActiveStore;

DELIMITER $$
CREATE PROCEDURE getActiveStore (IN id INT)
BEGIN
	IF NOT EXISTS(SELECT * FROM Enterprise WHERE Enterprise.Enterprise_ID = id) THEN SELECT 'ID is not valid' as '';
    ELSE SELECT COUNT(*) FROM Store WHERE Store.Store_Enterprise = id AND Store.Store_Active = 1; 
    END IF;
END; $$


-- count number of inactive stores
-- USE Assignment;
-- DROP PROCEDURE IF EXISTS getInactiveStore;

DELIMITER $$
CREATE PROCEDURE getInactiveStore (IN id INT)
BEGIN
	IF NOT EXISTS(SELECT * FROM Enterprise WHERE Enterprise.Enterprise_ID = id) THEN SELECT 'ID is not valid' as '';
    ELSE SELECT COUNT(*) FROM Store WHERE Store.Store_Enterprise = id AND Store.Store_Active = 0; 
    END IF;
END; $$






-- check area pass threshold
-- USE Assignment;
-- DROP FUNCTION IF EXISTS checkArea;

DELIMITER $$
CREATE FUNCTION checkArea(id INT, threshold INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE area INT;
	IF NOT EXISTS(SELECT * FROM Enterprise WHERE Enterprise.Enterprise_ID = id) THEN BEGIN
		-- SELECT 'ID is not valid' as '';
        RETURN 0;
    END;
    ELSE BEGIN 
		SET area = (SELECT SUM(Stock_Area) FROM Stock WHERE Stock.Stock_Enterprise = id);
		IF area < threshold THEN RETURN 0;
        ELSE RETURN 1;
        END IF;
    END;
    END IF;
    RETURN 0;
END; $$



-- insert enterprise -> insert default store
-- USE Assignment;
-- DROP TRIGGER IF EXISTS insertEnterprise;

DELIMITER $$
CREATE TRIGGER insertEnterprise AFTER INSERT ON Enterprise
FOR EACH ROW
BEGIN
	INSERT INTO Store 
    SET 
    Store_ID = 1,
    Store_Enterprise = NEW.Enterprise_ID,
    Store_Active = 1,
    Store_Address = 'Bach Khoa',
    Store_Avatar = 'A.jpg',
    Store_Manager = NULL,
    Store_Stock = NULL;
END; $$
