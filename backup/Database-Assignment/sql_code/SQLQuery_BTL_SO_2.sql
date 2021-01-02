
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

---INSERT Dữ liệu-----------------

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

INSERT INTO Enterprise VALUES (01, 'Ministop', NULL, 'ThuDuc', 'ministop@gmail.com', '0857123365', 'Useful', 'admin1');
INSERT INTO Enterprise VALUES (02, 'CircleK', NULL, 'GoVap', 'CircleK@gmail.com', '0124753689', 'Convenient', 'admin2');
INSERT INTO Enterprise VALUES (03, 'Familymart', NULL, 'BinhThanh', 'Familymart@gmail.com', '0919369444', 'Reasonable', 'admin3');
INSERT INTO Enterprise VALUES (04, 'Vinmart', NULL, 'BinhTan', 'Vinmart@gmail.com', '0857123361', 'Quality', 'admin4');


INSERT INTO Certification VALUES (01, 'food' , 'MNS'); 
INSERT INTO Certification VALUES (02, 'drink', 'CK');
INSERT INTO Certification VALUES (03, 'household' , 'FMM');
INSERT INTO Certification VALUES (04, 'food' , 'VM'); 


INSERT INTO Stock VALUES (1234, 'ThuDuc', 1123.541, 01, 5, 0123);
INSERT INTO Stock VALUES (1235, 'Quan10', 1113.041, 02, 4, 0103);
INSERT INTO Stock VALUES (1236, 'BinhChanh', 1103.541, 03, 6, 0023);
INSERT INTO Stock VALUES (1237, 'GoVap', 1423.541, 04, 5, 0113);


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

INSERT INTO Product_Batch VALUES (

INSERT INTO Store VALUES (101, 01, 0, 'ktx_khu_A', NULL, 01, 0123) 

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



INSERT INTO Manager VALUES (1915902, 1915902, 01, '08458523', '25552211'); 
INSERT INTO Manager VALUES (1915905, 1915905, 01, '08458524', '25552212');
INSERT INTO Manager VALUES (1815902, 1815902, 02, '08454524', '24552212'); 
INSERT INTO Manager VALUES (1815905, 1815905, 02, '08444524', '24452212'); 

INSERT INTO Store VALUES (101, 01, 0, 'ktx_khu_A', NULL, 1915902, 0123); 
INSERT INTO Store VALUES (102, 01, 0, 'ktx_khu_B', NULL, 1915905, 0123); 
INSERT INTO Store VALUES (201, 02, 1, 'Quan_10', NULL, 1815902, 0103);
INSERT INTO Store VALUES (202, 02, 1, 'Go_Vap', NULL, 1815905, 0113);

