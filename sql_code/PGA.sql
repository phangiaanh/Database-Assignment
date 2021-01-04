-- Account
INSERT INTO Account VALUES ('admin1', '123456781', 1);
INSERT INTO Account VALUES ('admin2', '123456791', 1);
INSERT INTO Account VALUES ('admin3', '123456771', 1);
INSERT INTO Account VALUES ('admin4', '123456761', 1);
INSERT INTO Account VALUES ('store1', '987654321', 1);
INSERT INTO Account VALUES ('store2', '987654320', 1);
INSERT INTO Account VALUES ('store3', '987654322', 1);
INSERT INTO Account VALUES ('store4', '987654324', 1);
INSERT INTO Account VALUES ('store5', '987654325', 1);
INSERT INTO Account VALUES ('casher1', '976543211', 1);
INSERT INTO Account VALUES ('casher2', '976543212', 1);
INSERT INTO Account VALUES ('casher3', '976543213', 1);
INSERT INTO Account VALUES ('casher4', '976543214', 1);
INSERT INTO Account VALUES ('casher5', '976543215', 1);
INSERT INTO Account VALUES ('casher6', '976543216', 1);
INSERT INTO Account VALUES ('casher7', '976543217', 1);

insert into Account values ("giaanhphan", "001710009", 90),  ("philong", "001712033", 70);


-- Enterprise
INSERT INTO Enterprise VALUES (01, 'Ministop', NULL, 'ThuDuc', 'ministop@gmail.com', '0857123365', 'Useful', 'admin1');
INSERT INTO Enterprise VALUES (02, 'CircleK', NULL, 'GoVap', 'CircleK@gmail.com', '0124753689', 'Convenient', 'admin2');
INSERT INTO Enterprise VALUES (03, 'Familymart', NULL, 'BinhThanh', 'Familymart@gmail.com', '0919369444', 'Reasonable', 'admin3');
INSERT INTO Enterprise VALUES (04, 'Vinmart', NULL, 'BinhTan', 'Vinmart@gmail.com', '0857123361', 'Quality', 'admin4');
insert into Enterprise values
	(05, "Co Loa", NULL, "Ho Chi Minh", "contact@coloa.com", "19000001", "Cong ty Giai tri", "giaanhphan"), 
	(06, "Van Tich", NULL, "Vinh Long", "followme@vantich.com", "19000002", "Cong ty Doi no", "philong"),
    (07, "Dai Viet", NULL, "Binh Duong", "helloworld@daiviet.com", "19000003", "Cong ty Thoi trang", "giaanhphan");


-- Certification
INSERT INTO Certification VALUES (01, 'food' , 'MNS'); 
INSERT INTO Certification VALUES (02, 'drink', 'CK');
INSERT INTO Certification VALUES (03, 'household' , 'FMM');
INSERT INTO Certification VALUES (04, 'food' , 'VM'); 


-- Store
INSERT INTO Store VALUES (101, 01, 0, 'ktx_khu_A', NULL, NULL, 0123); 
INSERT INTO Store VALUES (102, 01, 0, 'ktx_khu_B', NULL, NULL, 0123); 
INSERT INTO Store VALUES (201, 02, 1, 'Quan_10', NULL, NULL, 0103);
INSERT INTO Store VALUES (202, 02, 1, 'Go_Vap', NULL, NULL, 0113);
insert into Store values 	(1100, 5, 1, "Ly Thuong Kiet", "Pikachu", NULL, 307),
							(1050, 5, 0, "Le Hong Phong", "Psyduck", NULL 313),
							(1030, 5, 0, "Ly Chinh Thang", "Nidoran", NULL, 307),
							(1040, 5, 1, "Ton Dan", "Electrode", NULL, 307),
							(1090, 5, 1, "Le Van Viet", "Snorlax", NULL, 313),
							(2010, 6, 0, "Nguyen Thai Hoc", "Charmander", NULL, 990),
							(2030, 6, 1, "Mau Than", "Squirtle", NULL, 990),
							(2040, 6, 1, "Pham Thai Buong", "Bulbasaur", NULL, 990);



-- Stock
INSERT INTO Stock VALUES (1234, 'ThuDuc', 1123.541, 01, 5, 0123);
INSERT INTO Stock VALUES (1235, 'Quan10', 1113.041, 02, 4, 0103);
INSERT INTO Stock VALUES (1236, 'BinhChanh', 1103.541, 03, 6, 0023);
INSERT INTO Stock VALUES (1237, 'GoVap', 1423.541, 04, 5, 0113);
insert into Stock values 	(307, "Tran Xuan Soan", 1735, 1, 3, 2409),
							(313, "Au Co", 2230, 1, 6, 5100),
                            (990, "Nguyen Hue", 990, 2, 2, 1234);



-- Batch and Product
INSERT INTO Batch VALUES (54321, 1234, 01, 'food', 'vinafood', 20, '2020-11-01');
INSERT INTO Batch VALUES (54322, 1234, 01, 'food', 'vinafood', 10, '2020-12-01');
INSERT INTO Batch VALUES (54323, 1234, 01, 'food', 'vinafood', 20, '2020-12-10');
INSERT INTO Batch VALUES (54301, 1235, 02, 'drink', 'pepsi', 25, '2020-11-02');
INSERT INTO Batch VALUES (54311, 1235, 02, 'drink', 'pepsi', 20, '2020-11-10');
INSERT INTO Batch VALUES (54331, 1235, 02, 'drink', 'pepsi', 15, '2020-12-02');
INSERT INTO Batch VALUES (54111, 1236, 03, 'household', 'Toshiba', 20, '2020-11-03');
INSERT INTO Batch VALUES (54112, 1236, 03, 'household', 'Toshiba', 10, '2020-12-03');
INSERT INTO Batch VALUES (50111, 1237, 04, 'food', 'Saigonfood', 30, '2020-10-01');
INSERT INTO Batch VALUES (50112, 1237, 04, 'food', 'Saigonfood', 20, '2020-11-01');
INSERT INTO Batch VALUES (50113, 1237, 04, 'food', 'Saigonfood', 30, '2020-12-01');


INSERT INTO Product VALUES (654321, 'KOKOMI', 'Noodle', 'Vinafood', 54321, '2020-01-10', '2021-01-10', 'product_for_everyone', 'flour_salt_salad', 3000);
INSERT INTO Product VALUES (654322, 'OMACHI', 'Noodle', 'Vinafood', 54321, '2020-01-10', '2021-01-10', 'product_for_everyone', 'flour_salt_salad_chicken', 3000 );
INSERT INTO Product VALUES (654323, 'PEPSI', 'COKE', 'pepsi', 54301, '2020-02-10', '2021-02-10', 'product_for_eveyone', 'water_coca', 8000 );
INSERT INTO Product VALUES (654324, 'AQUAFINA', 'WATER', 'pepsi', 54301, '2020-02-10', '2021-02-10', 'product_for_eveyone', 'water', 5000 );
INSERT INTO Product VALUES (654325, 'KIWICAKE', 'CAKE', 'Saigonfood', 50112, '2020-10-30', '2020-12-30', 'product_for_eveyone', 'cream_kiwi_flour', 10000);
INSERT INTO Product VALUES (654326, 'CHOCOLATECAKE', 'CAKE', 'Saigonfood', 50112, '2020-10-30', '2020-12-30', 'product_for_eveyone', 'cream_chocolate_flour', 10000);



-- Worker
INSERT INTO  Worker Values (1915900, 01, 101, 'ThanhNguyen', '341995424', '0857123370');
INSERT INTO  Worker Values (1915901, 01, 101, 'NgocLe', '351995425', '0957223371');
INSERT INTO  Worker Values (1915902, 01, 101, 'AnhThu', '351005425', '0957220071');
INSERT INTO  Worker Values (1915903, 01, 102, 'PhiLong', '300995425', '0957003371');
INSERT INTO  Worker Values (1915904, 01, 102, 'ThaoNguyen', '361995426', '0157323372');
INSERT INTO  Worker Values (1915905, 01, 102, 'TrungTran', '371995427', '0257124373');
INSERT INTO  Worker Values (1815900, 02, 201, 'TuNgo', '441995424', '0897223370');
INSERT INTO  Worker Values (1815901, 02, 201, 'QuynhLe', '541995424', '0998223371')
INSERT INTO  Worker Values (1815902, 02, 201, 'CaoSang', '541995400', '0108224372')
INSERT INTO  Worker Values (1815903, 02, 202, 'ThanhLy', '641995424', '0998223372')
INSERT INTO  Worker Values (1815904, 02, 202, 'GiaAnh', '741995424', '0998223373')
INSERT INTO  Worker Values (1815905, 02, 202, 'QuyenTran', '841995424', '0198223374')


INSERT INTO Staff VALUES (1915900, 101, 01, '2020-06-12');
INSERT INTO Staff VALUES (1915901, 101, 01, '2020-08-12');
INSERT INTO Staff VALUES (1915903, 102, 01, '2020-01-12');
INSERT INTO Staff VALUES (1915904, 102, 01, '2020-03-10');
INSERT INTO Staff VALUES (1815900, 201, 02, '2020-02-01');
INSERT INTO Staff VALUES (1815901, 201, 02, '2019-12-31');
INSERT INTO Staff VALUES (1815903, 202, 02, '2020-02-01');
INSERT INTO Staff VALUES (1815904, 202, 02, '2019-12-11');



INSERT INTO Manager VALUES (1915902, 101, 01, '08458523', '25552211'); 
INSERT INTO Manager VALUES (1915905, 102, 01, '08458524', '25552212');
INSERT INTO Manager VALUES (1815902, 201, 02, '08454524', '24552212'); 
INSERT INTO Manager VALUES (1815905, 202, 02, '08444524', '24452212');