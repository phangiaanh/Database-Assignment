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


