 module.exports.getAllEnterprises = 'SELECT * FROM Enterprise';

 module.exports.getEnterpriseByID = (entID) => {return 'SELECT * FROM Enterprise WHERE Enterprise.Enterprise_ID = ' + entID};

 module.exports.getAllStoreByEntID = (entID) => {
    return `SELECT a.Store_ID, a.Store_Address, b.Stock_Address, b.Stock_ID from Store as a inner join Stock as b on a.Store_Stock=b.Stock_ID where a.Store_Enterprise = ${entID}  order by  b.Stock_ID desc`;
}

 module.exports.getExactStoreAddress = 'call GetExactStoreAddress()';

//var getAllStore = 'SELECT a.store_id, a.store_address, b.stock_address, b.stock_id from store as a inner join stock as b on a.Store_Stock=b.stock_id';

 module.exports.getNumberOfStoreByID = (entID) => {return `select store_count(${entID}) as store_count`}

 module.exports.getAllStoreAddressExcept = (storeID) => {
        return `select s.Store_ID, e.Enterprise_Name, e.Enterprise_Address, s.Store_Address from Enterprise as e left join Store as s on e.Enterprise_ID = s.Store_Enterprise where s.Store_ID <> '${storeID}' order by s.Store_Address`;
    }

 module.exports.getEntNotInVL_Has_lt4_store = 'select e.Enterprise_Name, e.Enterprise_Address, count(s.Store_ID) from Enterprise as e left join Store as s on e.Enterprise_ID=s.Store_Enterprise where e.Enterprise_Address <> "Vinh Long" group by e.Enterprise_ID having count(s.Store_ID) < 4 order by e.Enterprise_Address';

 module.exports.getAllStock = 'select Stock_ID, Enterprise_Name, Stock_Address from Stock join Enterprise on Stock_Enterprise=Enterprise_ID';

 module.exports.getStockSupporting_mt2_Store = 'select Stock.Stock_Address, count(Store_ID) from Stock inner join Store on Stock_ID=Store_Stock where Store_Address <> "Ly Chinh Thang" group by Stock_ID having count(Store_ID) > 2 order by Stock_Address';

 module.exports.getStockAreaLessThan = (area) => {return `call getStockAreaLessThan(${area})`};



  //======================THANH================

module.exports.getStoreOfEntNameStartedByM = `SELECT Store_ID, a.Store_Enterprise, b.Enterprise_ID, Enterprise_Name, Enterprise_Address FROM Store AS a INNER JOIN Enterprise AS b ON a.Store_Enterprise = b.Enterprise_ID  WHERE  Enterprise_Name LIKE 'M%' ORDER BY Store_ID`;

module.exports.getBatchHasQuantity_mt20 =`SELECT a.Batch_Stock, Batch_ID, b.Stock_ID, Stock_Address, Batch_Quantity FROM Batch AS a INNER JOIN Stock AS b ON a.Batch_Stock = b.Stock_ID WHERE Batch_Quantity >= 20 ORDER BY Batch_ID DESC`;

module.exports.getFoodBatchHasTotalProductCost_mt3000 =`SELECT a.Batch_ID, Batch_ProductType, b.Product_Batch, SUM(Product_cost) FROM Batch AS a RIGHT JOIN Product AS b ON a.Batch_ID = b.Product_Batch WHERE Batch_ProductType = 'food' GROUP BY a.Batch_ID HAVING SUM(Product_cost) > 3000 ORDER BY Batch_ID DESC`;

module.exports.getEntHas_mt3_WorkerNotWorkIn = (store_ID) => {return `SELECT e.Enterprise_ID, e.Enterprise_Name, count(w.Worker_ID) as Ent_Worker_Count FROM Worker AS w RIGHT JOIN Enterprise AS e ON w.Worker_Enterprise = e.Enterprise_ID WHERE w.Worker_Store <> '${store_ID}' GROUP BY e.Enterprise_ID HAVING Ent_Worker_Count > 3 ORDER BY w.Worker_name DESC;`}

module.exports.getAllStaff = `Select * from Staff`;

module.exports.getStaffInformation = (id) => {return `call GetStaffInformation(${id})`}

module.exports.getNumOfAccountHasSameLevel = (id) => {return `call GetNumOfAccountHasSameLevel(${id})`}

module.exports.getNumberOfWorkerByEntID = (entID) => {return `select getWorkerCount(${entID}) as worker_count`}