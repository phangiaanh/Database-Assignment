DELIMITER $$
-- DROP PROCEDURE GetStaffInformation;
CREATE PROCEDURE GetStaffInformation (Id INT)
BEGIN 
SELECT Staff_ID, Worker_Store, Worker_Enterprise, Worker_Name, Worker_Phone
FROM Staff LEFT JOIN Worker
ON Staff_ID=Worker_ID
WHERE Staff_ID = Id ;
END $$



-- DROP PROCEDURE  GetNumOfAccountHasSameLevel;
DELIMITER $$
CREATE PROCEDURE  GetNumOfAccountHasSameLevel (IN level_in int)
BEGIN
	if level_in <= 0 then	SELECT "Gia tri dau vao phai la so duong";
	else
		SELECT Account_Username, Account_Password, Account_Level  
		FROM Account
        WHERE Account_Level = level_in;
	END if;
END $$



DELIMITER $$
-- DROP PROCEDURE AddNewCertification;
CREATE PROCEDURE AddNewCertification(IN EnterpriseId INT, IN Field VARCHAR(20), IN Certi_Code VARCHAR(10)) 
BEGIN
    IF EXISTS (SELECT * FROM Certification WHERE Certification_Code = Certi_Code) THEN
		SELECT 'THIS Certification Code HAS BEEN USED' as ReturnError;
	ELSE IF NOT EXISTS (SELECT * FROM Enterprise WHERE  Enterprise_ID = EnterpriseId) THEN
		SELECT 'Enterprise has not existed in database' as ReturnError;
	ELSE
		BEGIN
			INSERT INTO Certification VALUES (EnterpriseId, Field, Certi_Code);
			SELECT 'INSERT SUCCESSFULLY';
		END;
        END IF;
    END IF;
END $$




-- 3--- Trigger---
 
CREATE TRIGGER Product_After_Insert AFTER INSERT ON  Product  FOR EACH ROW UPDATE Batch
BEGIN
   SET Batch_ID = Batch_ID + 1
   WHERE Batch_ID = new.Product_Batch
   

CREATE TRIGGER Batch_AFTER_INSERT AFTER INSERT ON Batch FOR EACH ROW UPDATE Stock
SET Stock_ID = Stock_ID + 1
WHERE Stock_ID = new.Batch_Stock

CREATE TRIGGER Staff_After_Delete AFTER DELETE ON Staff FOR EACH ROW update Worker
SET Worker_ID = Worker_ID - 1
WHERE Worker_ID = old.Staff_ID

DELIMITER $$
CREATE TRIGGER Staff AFTER UPDATE ON Staff FOR EACH ROW 
 BEGIN
	if new.Staff_ID = Staff_ID + 1000000  then
		begin
            SET foreign_key_checks = 0;
			update Worker set Worker_ID = Worker_ID + 1000000 where Worker_ID = new.Staff_ID;
            SET foreign_key_checks = 1;
        end;
        end if; 
END$$

-- -4---- 

DELIMITER $$
-- DROP FUNCTION getWorkerCount;
CREATE FUNCTION getWorkerCount (enter_ID INT ) RETURNS INT
    DETERMINISTIC
BEGIN
	declare rtvalue int;
	if enter_ID <> 0 then
		set rtvalue = (select COUNT(*)
						from Worker
						where Worker_Enterprise = enter_ID
                        group by Worker_Enterprise);
		else set rtvalue = (select COUNT(*) from Worker); 
    end if;
    if rtvalue is null then return 0;
    else return rtvalue;
    end if;
END$$

