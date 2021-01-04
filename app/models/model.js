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


