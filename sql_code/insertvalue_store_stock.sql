insert into account values ("giaanhphan", "1710009", 90),  ("philong", "1712033", 70);
insert into enterprise values
	(1, "Co Loa", "Trong Dong", "Ho Chi Minh", "contact@coloa.com", "19000001", "Cong ty Giai tri", "giaanhphan"), 
	(2, "Van Tich", "Long Vu", "Vinh Long", "followme@vantich.com", "19000002", "Cong ty Doi no", "philong"),
    (3, "Dai Viet", "Co Lau", "Binh Duong", "helloworld@daiviet.com", "19000003", "Cong ty Thoi trang", "giaanhphan");
insert into stock values 	(307, "Tran Xuan Soan", 1735, 1, 3, 2409),
							(313, "Au Co", 2230, 1, 6, 5100),
                            (990, "Nguyen Hue", 990, 2, 2, 1234);
                            
insert into store values 	(1100, 1, 1, "Ly Thuong Kiet", "Pikachu", NULL, 307),
							(1050, 1, 1, "Le Hong Phong", "Psyduck", NULL 313),
							(1030, 1, 1, "Ly Chinh Thang", "Nidoran", NULL, 307),
							(1040, 1, 1, "Ton Dan", "Electrode", NULL, 307),
							(1090, 1, 1, "Le Van Viet", "Snorlax", NULL, 313),
							(2010, 2, 1, "Nguyen Thai Hoc", "Charmander", NULL, 990),
							(2030, 2, 1, "Mau Than", "Squirtle", NULL, 990),
							(2040, 2, 1, "Pham Thai Buong", "Bulbasaur", NULL, 990);

insert into worker values   (10, 1100, 1, "Tran Duc Bo", "331902859", "03212345678"),
							(20, 1050, 1, "Tran Dan", "331624839", "03212345678"),
							(30, 1030, 1, "Tran Thanh Tam", "331985712", "03312345678"),
							(40, 1040, 1, "Tran Thu Do", "331996354", "06912345678"),
							(50, 1090, 1, "Tran Hung Dao", "338542859", "02712345678"),
							(70, 2010, 2, "Le Loi", "3385472169", "06512345678"),
							(80, 2030, 2, "Le Lai", "3318459319", "01312345678"),
							(90, 2040, 2, "Le Thanh Tong", "3302458759", "03912345678")
                            (110, 2040, 2, "Nguyen Hien", "39875645", "0312319857"), 
							(120, 2040, 2, "Nguyen Trai", "39875645", "0312319857"), 
                            (130, 2040, 2, "Nguyen Linh", "39875645", "0312319857"); 
                            
insert into manager values  (10, 1100, 1, "A4561", "Z854693C"),  
							(20, 1050, 1, "C2135", "Z854699W"),
							(30, 1030, 1, "A8654", "Z8512397"),
                            (40, 1040, 1, "A5151", "Z8531298"),
                            (50, 1090, 1, "B7652", "Z1314233"),
                            (70, 2010, 2, "A0432", "Z1245430"), 
                            (80, 2030, 2, "A3120", "Z5404936"),
                            (90, 2040, 2, "A3123", "Z546936A");                        
insert into staff values  (110, 2040, 2, null), (120, 2040, 2, null), (130, 2040, 2, null);



SELECT a.store_id, a.store_address, b.stock_address, b.stock_id
from store as a inner join stock as b 
on a.Store_Stock=b.stock_id 
where a.Store_ID < 2000
order by  b.stock_id desc;

select s.store_id, e.enterprise_name, e.enterprise_address, s.store_address 
from enterprise as e left join store as s
on e.Enterprise_ID = s.Store_Enterprise
where s.Store_ID <> 1100
order by s.Store_Address;

select e.enterprise_name, e.Enterprise_Address, count(s.store_id)
from enterprise as e left join store as s
on e.Enterprise_ID=s.Store_Enterprise
where e.Enterprise_Address <> "Vinh Long"
group by e.Enterprise_ID
having count(s.store_id) < 4
order by e.Enterprise_Address;

select e.enterprise_name, e.Enterprise_Address, count(s.store_id)
from enterprise as e left join store as s
on e.Enterprise_ID=s.Store_Enterprise
where e.Enterprise_Address <> "Vinh Long"
group by e.Enterprise_ID
having count(s.store_id) < 4
order by e.Enterprise_Address;

select stock.stock_address, count(store_id)
from stock inner join store
on stock_id=store_stock
where Store_Address <> "Ly Chinh Thang"
group by stock_id
having count(store_id) > 2
order by stock_address;

SET foreign_key_checks = 0;
update worker set worker_store = 2040 where worker_store = 0;
update staff set staff_store = 2040 where staff_store = 0;
SET foreign_key_checks = 1;