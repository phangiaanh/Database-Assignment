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
