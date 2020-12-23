var conn = require('./connection')

exports.listAllEnterprises = function(req, res) {
    var sql = 'SELECT * FROM Test.Enterprise';
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results[0])
        res.send(results[0])
    })
}

exports.listEnterpriseWithID = function(id, res) {
    var sql = 'SELECT * FROM Test.Enterprise WHERE Test.Enterprise.Enterprise_ID = ' + id;
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results[0])
        res.send(results[0])
    })
}