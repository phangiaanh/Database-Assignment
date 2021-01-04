var conn = require('./connection')
var sqlCmd = require('./SQLcommand')
exports.listAllEnterprises = function(req, res) {
    var sql = sqlCmd.getAllEnterprises;
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results)
        res.send(results)
    })
}

exports.getEntNotInVL_Has_lt4_store = function(req, res) {
    var sql = sqlCmd.getEntNotInVL_Has_lt4_store;
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results)
        res.send(results)
    })
}

exports.listEnterpriseWithID = function(id, res) {
    var sql = sqlCmd.getEnterpriseByID(id);
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results[0])
        res.send(results[0])
    })
}

exports.getExactStoreAddress = function(req, res) {
    var sql = sqlCmd.getExactStoreAddress;
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results[0])
        res.send(results)
    })
}
exports.getAllStoreByEntID = function(id, res) {
    var sql = sqlCmd.getAllStoreByEntID(id);
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results[0])
        res.send(results)
    })
}
exports.getAllStoreAddressExcept = function(id, res) {
    var sql = sqlCmd.getAllStoreAddressExcept(id);
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results[0])
        res.send(results)
    })
}
exports.getStoreCountByID = function(id, res) {
    var sql = sqlCmd.getNumberOfStoreByID(id);
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results[0])
        res.send(results[0])
    })
}

exports.getAllStock = function(req, res) {
    var sql = sqlCmd.getAllStock;
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results[0])
        res.send(results)
    })
}

exports.getStockSupporting_mt2_Store = function(req, res) {
    var sql = sqlCmd.getStockSupporting_mt2_Store;
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results[0])
        res.send(results)
    })
}

exports.getStockAreaLessThan = function(square, res) {
    var sql = sqlCmd.getStockAreaLessThan(square);
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results)
        res.send(results)
    })
}

// THANH

exports.getStoreOfEntNameStartedByM = function(req, res) {
    var sql = sqlCmd.getStoreOfEntNameStartedByM;
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results)
        res.send(results)
    })
}

exports.getBatchHasQuantity_mt20 = function(req, res) {
    var sql = sqlCmd.getBatchHasQuantity_mt20;
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results)
        res.send(results)
    })
}

exports.getFoodBatchHasTotalProductCost_mt3000 = function(req, res) {
    var sql = sqlCmd.getFoodBatchHasTotalProductCost_mt3000;
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results)
        res.send(results)
    })
}

exports.getEntHas_mt3_WorkerNotWorkIn = function(store_id, res) {
    var sql = sqlCmd.getEntHas_mt3_WorkerNotWorkIn(store_id);
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results)
        res.send(results)
    })
}

exports.getAllStaff = function(req, res) {
    var sql = sqlCmd.getAllStaff;
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results)
        res.send(results)
    })
}

exports.getStaffInformation = function(id, res) {
    var sql = sqlCmd.getStaffInformation(id);
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results)
        res.send(results)
    })
}

exports.getNumOfAccountHasSameLevel = function(level, res) {
    var sql = sqlCmd.getNumOfAccountHasSameLevel(level);
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results)
        res.send(results)
    })
}

exports.getNumberOfWorkerByEntID = function(ent_ID, res) {
    var sql = sqlCmd.getNumberOfWorkerByEntID(ent_ID);
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results)
        res.send(results)
    })
}

exports.changeStoreState = function(req, res) {
    id = req.params.id;
    action = req.body.active;
    if(active) var sql = 'SET foreign_key_checks = 0;    update worker set worker_store = 6040 where worker_store = 0;    update staff set staff_store = 6040 where staff_store = 0;    SET foreign_key_checks = 1;';
    else var sql = `Update Store set Store_Active=0 where Store_ID = ${id}`  
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results)
        res.send(results)
    })
}

exports.addNewCertification = function(req, res) {
    req = req.body;
    console.log(req);
    var sql = `call AddNewCertification(${req.ent_ID}, '${req.field}', '${req.certi_code}')`;
    sql = sql.replace(/(\r\n|\n|\t|\r)/gm,"");
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results)
        res.send(results)
    })
}