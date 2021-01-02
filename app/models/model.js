var conn = require('./connection')

exports.checkAccount = function(username, password, res) {
    var sql = 'SELECT * FROM Account WHERE Account.Account_Username = \'' + username + '\' AND Account.Account_Password = ' + password;
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results)
        x = 1
        res.end(`temp=${JSON.stringify(results[0])}`)
    })
}

exports.listAllEnterprises = function(req, res) {
    var sql = 'SELECT * FROM Enterprise';
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results)
        res.end(`temp=${JSON.stringify(results)}`)
    })
}

exports.listEnterpriseWithID = function(id, res) {  
    var sql = 'SELECT * FROM Enterprise WHERE Enterprise.Enterprise_ID = ' + id;
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results[0])
        res.send(results[0])
    })
}

exports.getStockID = function(id) {

}