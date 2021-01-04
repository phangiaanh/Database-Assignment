 module.exports.getAllEnterprises = 'SELECT * FROM lab6_eng.Enterprise';

 module.exports.getEnterpriseByID = (entID) => {return 'SELECT * FROM lab6_eng.Enterprise WHERE lab6_eng.Enterprise.Enterprise_ID = ' + entID};

 module.exports.getAllStoreByEntID = (entID) => {
    return `SELECT a.store_id, a.store_address, b.stock_address, b.stock_id from store as a inner join stock as b on a.Store_Stock=b.stock_id where a.Store_ID < ${entID * 1000 + 1000} and a.Store_ID >= ${entID * 1000}  order by  b.stock_id desc`;
}

 module.exports.getExactStoreAddress = 'call lab6_eng.GetExactStoreAddress()';

//var getAllStore = 'SELECT a.store_id, a.store_address, b.stock_address, b.stock_id from store as a inner join stock as b on a.Store_Stock=b.stock_id';

 module.exports.getNumberOfStoreByID = (entID) => {return `select lab6_eng.store_count(${entID}) as store_count`}

 module.exports.getAllStoreAddressExcept = (storeID) => {
        return `select s.store_id, e.enterprise_name, e.enterprise_address, s.store_address from enterprise as e left join store as s on e.Enterprise_ID = s.Store_Enterprise where s.Store_ID <> '${storeID}' order by s.Store_Address`;
    }

 module.exports.getEntNotInVL_Has_lt4_store = 'select e.enterprise_name, e.Enterprise_Address, count(s.store_id) from enterprise as e left join store as s on e.Enterprise_ID=s.Store_Enterprise where e.Enterprise_Address <> "Vinh Long" group by e.Enterprise_ID having count(s.store_id) < 4 order by e.Enterprise_Address';

 module.exports.getAllStock = 'select Stock_ID, enterprise_name, Stock_Address from stock join enterprise on Stock_Enterprise=Enterprise_ID';

 module.exports.getStockSupporting_mt2_Store = 'select stock.stock_address, count(store_id) from stock inner join store on stock_id=store_stock where Store_Address <> "Ly Chinh Thang" group by stock_id having count(store_id) > 2 order by stock_address';

 module.exports.getStockAreaLessThan = (area) => {return `call lab6_eng.getStockAreaLessThan(${area})`};