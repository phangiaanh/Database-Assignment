 //PHI LONG
 
 //------ENTERPRISE----------
 module.exports.getAllEnterprises = 'SELECT * FROM lab6_eng.Enterprise';

 module.exports.getEnterpriseByID = (entID) => {return 'SELECT * FROM lab6_eng.Enterprise WHERE lab6_eng.Enterprise.Enterprise_ID = ' + entID};

 module.exports.getAllStoreByEntID = (entID) => {
    return `SELECT a.store_id, a.store_address, b.stock_address, b.stock_id from store as a inner join stock as b on a.Store_Stock=b.stock_id where a.Store_Enterprise = ${entID}  order by  b.stock_id desc`;
}

 //------STORE----------
 module.exports.getExactStoreAddress = 'call lab6_eng.GetExactStoreAddress()';

 module.exports.getNumberOfStoreByID = (entID) => {return `select lab6_eng.store_count(${entID}) as store_count`}

 module.exports.getAllStoreAddressExcept = (storeID) => {
        return `select s.store_id, e.enterprise_name, e.enterprise_address, s.store_address from enterprise as e left join store as s on e.Enterprise_ID = s.Store_Enterprise where s.Store_ID <> '${storeID}' order by s.Store_Address`;
    }

 module.exports.getEntNotInVL_Has_lt4_store = 'select e.enterprise_name, e.Enterprise_Address, count(s.store_id) from enterprise as e left join store as s on e.Enterprise_ID=s.Store_Enterprise where e.Enterprise_Address <> "Vinh Long" group by e.Enterprise_ID having count(s.store_id) < 4 order by e.Enterprise_Address';

 //------STOCK----------

 module.exports.getAllStock = 'select Stock_ID, enterprise_name, Stock_Address from stock join enterprise on Stock_Enterprise=Enterprise_ID';

 module.exports.getStockSupporting_mt2_Store = 'select stock.stock_address, count(store_id) from stock inner join store on stock_id=store_stock where Store_Address <> "Ly Chinh Thang" group by stock_id having count(store_id) > 2 order by stock_address';

 module.exports.getStockAreaLessThan = (area) => {return `call lab6_eng.getStockAreaLessThan(${area})`};


 //======================THANH================

module.exports.getStoreOfEntNameStartedByM = `SELECT Store_ID, a.Store_Enterprise, b.Enterprise_ID, Enterprise_Name, Enterprise_Address FROM Store AS a INNER JOIN Enterprise AS b ON a.Store_Enterprise = b.Enterprise_ID  WHERE  Enterprise_Name LIKE 'M%' ORDER BY Store_ID`;

module.exports.getBatchHasQuantity_mt20 =`SELECT a.Batch_Stock, Batch_ID, b.Stock_ID, Stock_Address, Batch_Quantity FROM Batch AS a INNER JOIN Stock AS b ON a.Batch_Stock = b.Stock_ID WHERE Batch_Quantity >= 20 ORDER BY Batch_ID DESC`;

module.exports.getFoodBatchHasTotalProductCost_mt3000 =`SELECT a.Batch_ID, Batch_ProductType, b.Product_Batch, SUM(Product_cost) FROM Batch AS a RIGHT JOIN Product AS b ON a.Batch_ID = b.Product_Batch WHERE Batch_ProductType = 'food' GROUP BY a.Batch_ID HAVING SUM(Product_cost) > 3000 ORDER BY Batch_ID DESC`;

module.exports.getEntHas_mt3_WorkerNotWorkIn = (store_ID) => {return `SELECT e.Enterprise_ID, e.Enterprise_Name, count(w.Worker_ID) as Ent_Worker_Count FROM Worker AS w RIGHT JOIN Enterprise AS e ON w.Worker_Enterprise = e.Enterprise_ID WHERE w.Worker_Store <> '${store_ID}' GROUP BY e.Enterprise_ID HAVING Ent_Worker_Count > 3 ORDER BY w.Worker_name DESC;`}

module.exports.getAllStaff = `Select * from lab6_eng.Staff`;

module.exports.getStaffInformation = (id) => {return `call GetStaffInformation(${id})`}

module.exports.getNumOfAccountHasSameLevel = (id) => {return `call GetNumOfAccountHasSameLevel(${id})`}

module.exports.getNumberOfWorkerByEntID = (entID) => {return `select lab6_eng.getWorkerCount(${entID}) as worker_count`}