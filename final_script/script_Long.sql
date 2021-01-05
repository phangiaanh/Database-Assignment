-- STORE PROCEDURE
-- USE Assignment;
-- DROP PROCEDURE IF EXISTS GetExactStoreAddress;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetExactStoreAddress`()
BEGIN
	SELECT e.Enterprise_Name, e.Enterprise_Address, s.Store_Address  
    FROM Enterprise e 
    inner join Store s
    ON e.Enterprise_ID = s.Store_Enterprise;
END $$

-- USE Assignment;
-- DROP PROCEDURE IF EXISTS getStockAreaLessThan;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStockAreaLessThan`(IN area int)
BEGIN
	if area <= 0 then	SELECT "Gia tri dau vao phai la so duong";
	else
		SELECT e.Enterprise_Name, e.Enterprise_Address, s.Stock_Address, s.Stock_Area  
		FROM Enterprise e 
		inner join Stock s
		ON e.Enterprise_ID = s.Stock_Enterprise
        WHERE s.Stock_Area < area;
	END if;
END $$

-- TRIGGER

---------// BATCH - STOCK --------
-- USE Assignment;
-- DROP TRIGGER IF EXISTS batch_AFTER_INSERT;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `batch_AFTER_INSERT` AFTER INSERT ON `Batch` FOR EACH ROW UPDATE Stock
SET Stock_BatchNumber = Stock_BatchNumber + 1
WHERE Stock_ID = new.Batch_Stock


-- USE Assignment;
-- DROP TRIGGER IF EXISTS batch_AFTER_DELETE;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `batch_AFTER_DELETE` AFTER DELETE ON `Batch` FOR EACH ROW update Stock
SET Stock_BatchNumber = Stock_BatchNumber - 1
WHERE Stock_ID = old.Batch_Stock

---------// STORE-WORKER-STAFF-MANAGER --------
-- USE Assignment;
-- DROP TRIGGER IF EXISTS store_AFTER_UPDATE;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `store_AFTER_UPDATE` AFTER UPDATE ON `Store` FOR EACH ROW BEGIN
	if new.Store_Active = 0  then
		begin
			SET foreign_key_checks = 0;
			update Staff set Staff_Store=0 where Staff_Store=new.Store_ID;
			update Manager set Manager_Store=0 where Manager_Store=new.Store_ID;
			update Worker set Worker_Store=0 where Worker_Store=new.Store_ID;
			SET foreign_key_checks = 1;
        end;
        end if; 
END $$

-- STORED FUNCTION
-- USE Assignment;
-- DROP FUNCTION IF EXISTS store_count;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `store_count`(enter_ID int ) RETURNS int
    DETERMINISTIC
BEGIN
	declare rtvalue int;
	if enter_ID <> 0 then
		set rtvalue = (select count(Store_Enterprise) 
						from Store 
						where Store_Enterprise=enter_id 
						group by Store_Enterprise);
		else set rtvalue = (select count(*) from Store); 
    end if;
    if rtvalue is null then return 0;
    else return rtvalue;
    end if;
END $$
