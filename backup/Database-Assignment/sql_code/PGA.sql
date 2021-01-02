// Account
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

insert into account values ("giaanhphan", "001710009", 90),  ("philong", "001712033", 70);


// Enterprise
INSERT INTO Enterprise VALUES (01, 'Ministop', NULL, 'ThuDuc', 'ministop@gmail.com', '0857123365', 'Useful', 'admin1');
INSERT INTO Enterprise VALUES (02, 'CircleK', NULL, 'GoVap', 'CircleK@gmail.com', '0124753689', 'Convenient', 'admin2');
INSERT INTO Enterprise VALUES (03, 'Familymart', NULL, 'BinhThanh', 'Familymart@gmail.com', '0919369444', 'Reasonable', 'admin3');
INSERT INTO Enterprise VALUES (04, 'Vinmart', NULL, 'BinhTan', 'Vinmart@gmail.com', '0857123361', 'Quality', 'admin4');
insert into Enterprise values
	(05, "Co Loa", NULL, "Ho Chi Minh", "contact@coloa.com", "19000001", "Cong ty Giai tri", "giaanhphan"), 
	(06, "Van Tich", NULL, "Vinh Long", "followme@vantich.com", "19000002", "Cong ty Doi no", "philong"),
    (07, "Dai Viet", NULL, "Binh Duong", "helloworld@daiviet.com", "19000003", "Cong ty Thoi trang", "giaanhphan");


// Certification
INSERT INTO Certification VALUES (01, 'food' , 'MNS'); 
INSERT INTO Certification VALUES (02, 'drink', 'CK');
INSERT INTO Certification VALUES (03, 'household' , 'FMM');
INSERT INTO Certification VALUES (04, 'food' , 'VM'); 


// Stock 
