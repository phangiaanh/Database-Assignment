create table Account
(
    Account_Username varchar(20) not null
        primary key,
    Account_Password varchar(20) null,
    Account_Level    int         null
);

create table Enterprise
(
    Enterprise_ID          int           not null
        primary key,
    Enterprise_Name        varchar(30)   null,
    Enterprise_Avatar      varchar(50)   null,
    Enterprise_Address     varchar(50)   null,
    Enterprise_Email       varchar(20)   null,
    Enterprise_Hotline     varchar(15)   null,
    Enterprise_Description varchar(1000) null,
    Enterprise_Username    varchar(20)   not null,
    constraint Enteprise_ibfk_2
        foreign key (Enterprise_Username) references Account (Account_Username)
);

create table Certification
(
    Certification_Enterprise int         not null,
    Certification_Field      varchar(20) null,
    Certification_Code       varchar(10) not null
        primary key,
    constraint Certification_ibfk_1
        foreign key (Certification_Enterprise) references Enterprise (Enterprise_ID)
);

create table Manager
(
    Manager_ID          int         not null,
    Manager_Store       int         not null,
    Manager_Enterprise  int         not null,
    Manager_ContractID  varchar(20) null,
    Manager_InsuranceID varchar(20) null,
    primary key (Manager_ID, Manager_Store, Manager_Enterprise)
);

create table Stock
(
    Stock_ID          int            not null,
    Stock_Address     varchar(50)    null,
    Stock_Area        decimal(12, 3) null,
    Stock_Enterprise  int            not null,
    Stock_Age         smallint       null,
    Stock_BatchNumber int            null,
    primary key (Stock_Enterprise, Stock_ID),
    constraint Stock_ibfk_1
        foreign key (Stock_Enterprise) references Enterprise (Enterprise_ID)
);

create table Batch
(
    Batch_ID          int         not null
        primary key,
    Batch_Stock       int         null,
    Batch_Enterprise  int         null,
    Batch_ProductType varchar(30) null,
    Batch_Brand       varchar(30) null,
    Batch_Quantity    smallint    null,
    Batch_StartDate   date        null,
    constraint Batch_ibfk_1
        foreign key (Batch_Enterprise, Batch_Stock) references Stock (Stock_Enterprise, Stock_ID)
);

create index Batch_Enterprise
    on Batch (Batch_Enterprise, Batch_Stock);

create table Product
(
    Product_ID         int          not null
        primary key,
    Product_Name       varchar(50)  null,
    Product_Type       varchar(20)  null,
    Product_Brand      varchar(30)  null,
    Product_Batch      int          null,
    Product_MFG        date         null,
    Product_EXP        date         null,
    Product_Constraint varchar(300) null,
    Product_Ingredient varchar(500) null,
    Product_Cost       int          null,
    constraint Product_ibfk_1
        foreign key (Product_Batch) references Batch (Batch_ID)
);

create index Product_Batch
    on Product (Product_Batch);

create table Store
(
    Store_ID         int         not null,
    Store_Enterprise int         not null,
    Store_Active     bit         null,
    Store_Address    varchar(50) null,
    Store_Avatar     varchar(50) null,
    Store_Manager    int         null,
    Store_Stock      int         null,
    primary key (Store_Enterprise, Store_ID),
    constraint Store_ibfk_1
        foreign key (Store_Enterprise) references Enterprise (Enterprise_ID),
    constraint Store_ibfk_2
        foreign key (Store_Manager) references Manager (Manager_ID)
);

create table GDN
(
    GDN_ID         int      not null,
    GDN_Store      int      not null,
    GDN_Enterprise int      not null,
    GDN_TimeExport datetime null,
    GDN_TotalCost  int      null,
    GDN_Worker     int      null,
    primary key (GDN_ID, GDN_Store, GDN_Enterprise),
    constraint GDN_ibfk_1
        foreign key (GDN_Enterprise, GDN_Store) references Store (Store_Enterprise, Store_ID)
);

create index GDN_Enterprise
    on GDN (GDN_Enterprise, GDN_Store);

create table GDN_Product_Relation
(
    GDN_ID         int not null,
    GDN_Store      int not null,
    GDN_Enterprise int not null,
    Product_ID     int not null,
    Relation_Price int null,
    primary key (GDN_ID, GDN_Store, GDN_Enterprise, Product_ID),
    constraint GDN_Product_Relation_ibfk_1
        foreign key (GDN_ID, GDN_Store, GDN_Enterprise) references GDN (GDN_ID, GDN_Store, GDN_Enterprise),
    constraint GDN_Product_Relation_ibfk_2
        foreign key (Product_ID) references Product (Product_ID)
);

create index Product_ID
    on GDN_Product_Relation (Product_ID);

create table Worker
(
    Worker_ID         int         not null,
    Worker_Enterprise int         not null,
    Worker_Store      int         not null,
    Worker_Name       varchar(30) null,
    Worker_ICNumber   varchar(10) null,
    Worker_Phone      varchar(15) null,
    primary key (Worker_ID, Worker_Store, Worker_Enterprise),
    constraint Worker_ibfk_1
        foreign key (Worker_Enterprise, Worker_Store) references Store (Store_Enterprise, Store_ID)
);

create table GRN
(
    GRN_ID          int         not null,
    GRN_Stock       int         not null,
    GRN_Enterprise  int         not null,
    GRN_TimeExport  datetime    null,
    GRN_TotalCost   int         null,
    GRN_Delivery    varchar(30) null,
    GRN_WorkerCheck int         null,
    primary key (GRN_ID, GRN_Stock, GRN_Enterprise),
    constraint GRN_ibfk_1
        foreign key (GRN_Enterprise, GRN_Stock) references Stock (Stock_Enterprise, Stock_ID),
    constraint GRN_ibfk_2
        foreign key (GRN_WorkerCheck) references Worker (Worker_ID)
);

create index GRN_Enterprise
    on GRN (GRN_Enterprise, GRN_Stock);

create table GRN_Batch_Relation
(
    GRN_ID         int not null,
    GRN_Stock      int not null,
    GRN_Enterprise int not null,
    Batch_ID       int not null,
    Relation_Cost  int null,
    primary key (GRN_ID, GRN_Stock, GRN_Enterprise, Batch_ID),
    constraint GRN_Batch_Relation_ibfk_1
        foreign key (GRN_ID, GRN_Stock, GRN_Enterprise) references GRN (GRN_ID, GRN_Stock, GRN_Enterprise),
    constraint GRN_Batch_Relation_ibfk_2
        foreign key (Batch_ID) references Batch (Batch_ID)
);

create index Batch_ID
    on GRN_Batch_Relation (Batch_ID);

alter table Manager
    add constraint Manager_ibfk_1
        foreign key (Manager_ID, Manager_Store, Manager_Enterprise) references Worker (Worker_ID, Worker_Store, Worker_Enterprise);

create table Staff
(
    Staff_ID         int      not null,
    Staff_Store      int      not null,
    Staff_Enterprise int      not null,
    Staff_Expire     datetime not null,
    primary key (Staff_ID, Staff_Store, Staff_Enterprise),
    constraint Staff_ibfk_1
        foreign key (Staff_ID, Staff_Store, Staff_Enterprise) references Worker (Worker_ID, Worker_Store, Worker_Enterprise)
);

create table Timesheet
(
    Timesheet_Worker       int           not null,
    Timesheet_Store        int           not null,
    Timesheet_Enterprise   int           not null,
    Timesheet_WorkerNo     int           not null,
    Timesheet_Date         date          null,
    Timesheet_StartSession time          null,
    Timesheet_EndSession   time          null,
    Timesheet_Note         varchar(20)   null,
    Timesheet_HolidayRate  decimal(4, 2) null,
    Timesheet_Duration     time          null,
    primary key (Timesheet_Worker, Timesheet_Store, Timesheet_Enterprise, Timesheet_WorkerNo),
    constraint Timesheet_ibfk_1
        foreign key (Timesheet_Worker, Timesheet_Store, Timesheet_Enterprise) references Worker (Worker_ID, Worker_Store, Worker_Enterprise)
);

create index Worker_Enterprise
    on Worker (Worker_Enterprise, Worker_Store);



-- DELETE ALL RECORDS
SET foreign_key_checks = 0;
delete from Account;
delete from Enterprise;
delete from Certification;
delete from Store;
delete from Stock;
delete from Batch;
delete from Product;
delete from Worker;
delete from Manager;
delete from Staff;
SET foreign_key_checks = 1;

-- Account
INSERT INTO Account VALUES ('admin1', '123456781', 5);
INSERT INTO Account VALUES ('admin2', '123456791', 5);
INSERT INTO Account VALUES ('admin3', '123456771', 1);
INSERT INTO Account VALUES ('admin4', '123456761', 9);
INSERT INTO Account VALUES ('store1', '987654321', 5);
INSERT INTO Account VALUES ('store2', '987654320', 2);
INSERT INTO Account VALUES ('store3', '987654322', 9);
INSERT INTO Account VALUES ('store4', '987654324', 1);
INSERT INTO Account VALUES ('store5', '987654325', 3);
INSERT INTO Account VALUES ('casher1', '976543211', 4);
INSERT INTO Account VALUES ('casher2', '976543212', 8);
INSERT INTO Account VALUES ('casher3', '976543213', 9);
INSERT INTO Account VALUES ('casher4', '976543214', 12);
INSERT INTO Account VALUES ('casher5', '976543215', 1);
INSERT INTO Account VALUES ('casher6', '976543216', 2);
INSERT INTO Account VALUES ('casher7', '976543217', 4);
-- insert into Account values ('giaanhphan', '001710009', 90),  ('philong', '001712033', 70);

-- Enterprise
INSERT INTO Enterprise VALUES 	(01, 'Ministop', 'A.jpg', 'Ho Chi Minh', 'ministop@gmail.com', '0857123365', 'Cong ty Thuc Pham', 'admin1'),
								(02, 'CircleK', 'B.jpg', 'Ho Chi Minh', 'CircleK@gmail.com', '0124753689', 'Cong ty Nuoc Giai Khat', 'admin2'),
								(03, 'Familymart', 'C.jpg', 'Binh Duong', 'Familymart@gmail.com', '0919369444', 'Cong ty Do Gia Dung', 'admin3'),
								(04, 'Vinmart', 'D.jpg', 'Vinh Long', 'Vinmart@gmail.com', '0857123361', 'Cong ty Ca Phe', 'admin4'),
								(05, 'Co Loa', 'C.jpg', 'Ho Chi Minh', 'contact@coloa.com', '032897631', 'Cong ty Giai tri', 'admin1'), 
								(06, 'Van Tich', 'B.jpg', 'Vinh Long', 'followme@vantich.com', '069967891', 'Cong ty Doi no', 'admin1'),
								(07, 'Dai Viet', 'A.jpg', 'Binh Duong', 'feelme@daiviet.com', '0819928281', 'Cong ty Thoi trang', 'admin3');


-- Certification
INSERT INTO Certification VALUES (01, 'food' , 'MNS'); 
INSERT INTO Certification VALUES (02, 'drink', 'CK');
INSERT INTO Certification VALUES (03, 'household' , 'FMM');
INSERT INTO Certification VALUES (04, 'coffee' , 'VM');
INSERT INTO Certification VALUES (04, 'entertainment' , 'CL'); 
INSERT INTO Certification VALUES (04, 'wwe' , 'VT'); 
INSERT INTO Certification VALUES (04, 'fashion' , 'DV');  


-- Store
SET foreign_key_checks = 0;
INSERT INTO Store VALUES 	(1140, 1, 0, 'Ktx khu A', 'Kien Ba Khoang',NULL, 114),
							(1141, 1, 0, 'Ktx khu B', 'Shiba',NULL, 114),
							(2100, 2, 1, 'Ly Thuong Kiet', 'Cau Vang',NULL, 215),
							(2150, 2, 1, 'Nguyen Thai Son', 'De Choat',NULL, 215),
							(5100, 5, 1, 'Nguyen Tri Phuong', 'Pikachu',NULL, 507),
							(5050, 5, 0, 'Le Hong Phong', 'Psyduck',NULL, 513),
							(5030, 5, 0, 'Ly Chinh Thang', 'Nidoran',NULL, 507),
							(5040, 5, 1, 'Ton Dan', 'Electrode',NULL, 507),
							(5090, 5, 1, 'Le Van Viet', 'Snorlax',NULL, 513),
							(6010, 6, 0, 'Nguyen Thai Hoc', 'Charmander',NULL, 620),
							(6030, 6, 1, 'Mau Than', 'Squirtle',NULL, 620),
							(6040, 6, 1, 'Pham Thai Buong', 'Bulbasaur',NULL, 620);


-- Stock
INSERT INTO Stock VALUES 	(114, 'ktx khu A', 			1123.541, 1, 5, 0),
							(215, 'Pham Ngu Lao', 		1113.041, 2, 4, 0),
							(390, 'Le Hong Phong', 		1103.541, 3, 6, 0),
							(490, 'Dinh Tien Hoang', 	1423.541, 4, 5, 0),
							(507, 'Tran Xuan Soan', 	1735, 	  5, 3, 0),
							(513, 'Au Co', 				2230,     5, 6, 0),
                            (620, 'Nguyen Hue', 		990,      6, 2, 0);



-- Batch and Product
INSERT INTO Batch VALUES (54321, 114, 1, 'food', 'vinafood', 20, '2020-11-01');
INSERT INTO Batch VALUES (54322, 114, 1, 'food', 'vinafood', 10, '2020-12-01');
INSERT INTO Batch VALUES (54323, 114, 1, 'food', 'vinafood', 20, '2020-12-10');
INSERT INTO Batch VALUES (54301, 215, 2, 'drink', 'pepsi', 25, '2020-11-02');
INSERT INTO Batch VALUES (54311, 215, 2, 'drink', 'pepsi', 20, '2020-11-10');
INSERT INTO Batch VALUES (54331, 215, 2, 'drink', 'pepsi', 15, '2020-12-02');
INSERT INTO Batch VALUES (54111, 390, 3, 'household', 'Toshiba', 20, '2020-11-03');
INSERT INTO Batch VALUES (54112, 390, 3, 'household', 'Toshiba', 10, '2020-12-03');
INSERT INTO Batch VALUES (50111, 490, 4, 'food', 'Saigonfood', 30, '2020-10-01');
INSERT INTO Batch VALUES (50112, 490, 4, 'food', 'Saigonfood', 20, '2020-11-01');
INSERT INTO Batch VALUES (50113, 490, 4, 'food', 'Saigonfood', 30, '2020-12-01');


INSERT INTO Product VALUES (654321, 'KOKOMI', 'Noodle', 'Vinafood', 54321, '2020-01-10', '2021-01-10', 'product_for_everyone', 'flour_salt_salad', 3000);
INSERT INTO Product VALUES (654322, 'OMACHI', 'Noodle', 'Vinafood', 54321, '2020-01-10', '2021-01-10', 'product_for_everyone', 'flour_salt_salad_chicken', 3000 );
INSERT INTO Product VALUES (654323, 'PEPSI', 'COKE', 'pepsi', 54301, '2020-02-10', '2021-02-10', 'product_for_eveyone', 'water_coca', 8000 );
INSERT INTO Product VALUES (654324, 'AQUAFINA', 'WATER', 'pepsi', 54301, '2020-02-10', '2021-02-10', 'product_for_eveyone', 'water', 5000 );
INSERT INTO Product VALUES (654325, 'KIWICAKE', 'CAKE', 'Saigonfood', 50112, '2020-10-30', '2020-12-30', 'product_for_eveyone', 'cream_kiwi_flour', 10000);
INSERT INTO Product VALUES (654326, 'CHOCOLATECAKE', 'CAKE', 'Saigonfood', 50112, '2020-10-30', '2020-12-30', 'product_for_eveyone', 'cream_chocolate_flour', 10000);



-- Worker
INSERT INTO  Worker Values 	(1915900, 1140, 1, 'ThanhNguyen', '341995424', '0857123370'),
							(1915901, 1140, 1, 'NgocLe', '351995425', '0957223371'),
							(1915902, 1140, 1, 'AnhThu', '351005425', '0957220071'),
							(1915903, 1141, 1, 'PhiLong', '300995425', '0957003371'),
							(1915904, 1141, 1, 'ThaoNguyen', '361995426', '0157323372'),
							(1915905, 1141, 1, 'TrungTran', '371995427', '0257124373'),
							(1815900, 2100, 2, 'TuNgo', '441995424', '0897223370'),
							(1815901, 2100, 2, 'QuynhLe', '541995424', '0998223371'),
							(1815902, 2100, 2, 'CaoSang', '541995400', '0108224372'),
							(1815903, 2150, 2, 'ThanhLy', '641995424', '0998223372'),
							(1815904, 2150, 2, 'GiaAnh', '741995424', '0998223373'),
							(1815905, 2150, 2, 'QuyenTran', '841995424', '0198223374'),
							(1712033, 5100, 5, "Tran Duc Bo", "331902859", "03212345678"),
							(1712034, 5050, 5, "Tran Dan", "331624839", "03212345678"),
							(1712035, 5030, 5, "Tran Thanh Tam", "331985712", "03312345678"),
							(1712036, 5040, 5, "Tran Thu Do", "331996354", "06912345678"),
							(1712037, 5090, 5, "Tran Hung Dao", "338542859", "02712345678"),
							(1712038, 6010, 5, "Le Loi", "3385472169", "06512345678"),
							(1712039, 6030, 5, "Le Lai", "3318459319", "01312345678"),
							(1710008, 6040, 5, "Le Thanh Tong", "3302458759", "03912345678"),
                            (1710009, 6040, 5, "Nguyen Hien", "39875645", "0312319857"), 
							(1710010, 6040, 6, "Nguyen Trai", "39875645", "0312319857"), 
                            (1710011, 6040, 6, "Nguyen Linh", "39875645", "0312319857"); 

INSERT INTO Staff VALUES (1915900, 1140, 01, '2020-06-12');
INSERT INTO Staff VALUES (1915901, 1140, 01, '2020-08-12');
INSERT INTO Staff VALUES (1915903, 1141, 01, '2020-01-12');
INSERT INTO Staff VALUES (1915904, 1141, 01, '2020-03-10');
INSERT INTO Staff VALUES (1815900, 2100, 02, '2020-02-01');
INSERT INTO Staff VALUES (1815901, 2100, 02, '2019-12-31');
INSERT INTO Staff VALUES (1815903, 2140, 02, '2020-02-01');
INSERT INTO Staff VALUES (1815904, 2140, 02, '2019-12-11');
INSERT INTO Staff VALUES (1710009, 6040, 06, '2019-12-31');
INSERT INTO Staff VALUES (1710010, 6040, 06, '2020-02-01');
INSERT INTO Staff VALUES (1710011, 6040, 06, '2019-12-11');



INSERT INTO Manager VALUES (1915902, 1140, 1, '08458523', '25552211'); 
INSERT INTO Manager VALUES (1915905, 1141, 1, '08458524', '25552212');
INSERT INTO Manager VALUES (1815902, 2100, 2, '08454524', '24552212'); 
INSERT INTO Manager VALUES (1815905, 2150, 2, '08444524', '24452212');
INSERT INTO Manager VALUE  (1712033, 5100, 5, 'A4561231', 'Z854693C');
INSERT INTO Manager VALUES (1712034, 5050, 5, 'C2135213', 'Z854699W');
INSERT INTO Manager VALUES (1712035, 5030, 5, 'A8654532', 'Z8512397');
INSERT INTO Manager VALUES (1712036, 5040, 5, 'A5151577', 'Z8531298');
INSERT INTO Manager VALUES (1712037, 5090, 5, 'B7652854', 'Z1314233');
INSERT INTO Manager VALUES (1712038, 6010, 6, 'A0432727', 'Z1245430'); 
INSERT INTO Manager VALUES (1712039, 6030, 6, 'A3120772', 'Z5404936');
INSERT INTO Manager VALUES (1710008, 6040, 6, '08444524', '24452212');

SET foreign_key_checks = 1;



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








