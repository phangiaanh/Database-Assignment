-- 	Trigger
	-- DROP TRIGGER IF EXISTS after_insert_staff;
		DELIMITER $$
			CREATE TRIGGER after_insert_staff AFTER INSERT
			on Worker
			FOR EACH ROW
			BEGIN
				INSERT INTO Staff
			SET 
				Staff_ID = NEW.Worker_ID,
				Staff_Store = NEW.Worker_Store,
				Staff_Enterprise = NEW.Worker_Enterprise,
    			Staff_Expire = NOW();
			END $$
		DELIMITER ;
		--
		-- INSERT INTO Worker VALUES (171221, 111113, 143, 'Insert MAN', '0001000104', '0900123');

		-- DROP TRIGGER IF EXISTS before_update_staff;
		DELIMITER $$
			CREATE TRIGGER before_update_staff BEFORE UPDATE
			on Staff
			FOR EACH ROW
			BEGIN
				IF (NEW.Staff_Expire < CURDATE()) THEN 
					delete from Timesheet 
						where Timesheet_Worker = NEW.Staff_ID
							AND Timesheet_Startsession = CURDATE();
				END IF;
			END $$
		DELIMITER ;
		-- 
		-- insert into Staff VALUES (1912000, 1141, 01, '2021-12-31');
		-- INSERT INTO Timesheet VALUES (1912000, 1141, 1, 1, CURDATE(), '07:01:23', NULL, 'no note1', NULL, NULL);
		-- update Staff set Staff_Expire = '2020-12-01' where Staff_ID = 1912000;

		-- DROP TRIGGER IF EXISTS after_delete_worker;
		DELIMITER $$
			CREATE TRIGGER after_delete_worker AFTER DELETE
			ON Worker 
			FOR EACH ROW
			BEGIN
				delete from Staff where Staff_ID = OLD.Worker_ID;
				delete from Manager where Manager_ID = OLD.Worker_ID;
				delete from Timesheet where Timesheet_Worker = OLD.Worker_ID;
			END $$
		DELIMITER ;
		--
		-- insert into Worker values (1912000, 1, 1141, 'Insert man', NULL, NULL);
		-- delete from Worker where Worker_ID = 1912000;


-- FUNCTION
	-- DROP FUNCTION IF EXISTS SumOfWorkdateStore;
	DELIMITER $$
	CREATE FUNCTION SumOfWorkdateStore (StoreID int) returns int
	READS SQL DATA
	BEGIN
	DECLARE SumWorkdate int;
	select COUNT(Timesheet_Worker) INTO SumWorkdate
	FROM Timesheet WHERE Timesheet_Store = StoreID;
	return SumWorkdate;
	END $$
	DELIMITER ;