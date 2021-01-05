var conn = require('./connection')

exports.checkAccount = function(username, password, enter, res) {
    var sql = 'SELECT * from Enterprise a JOIN Account b ON a.Enterprise_Username = b.Account_Username WHERE a.Enterprise_Name = \'' + enter + '\' AND a.Enterprise_Username = \'' + username + '\' AND b.Account_Password = \'' + password + '\'';
    console.log(sql)
    conn.conn.query(sql, (err, results) => {
        if (err) {
            res.end(`temp=${0}`)
            return
        }
        if (results.length == 0) {
            res.end(`temp=${0}`)
            return
        }
        console.log(results)
        res.end(`temp=${1}`)
    })
}

exports.listAllEnterprises = function(req, res) {
    var sql = 'SELECT * FROM Enterprise';
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results)
            // res.send(results)
        res.end(`temp=${JSON.stringify(results)}`)
    })
}

exports.listEnterpriseWithID = function(id, res) {
    var sql = `SELECT * FROM Enterprise WHERE Enterprise.Enterprise_ID = ${id}`;
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results[0])
        res.send(results[0])
    })
}

exports.addEnterprise = function(req, res) {
    req = req.body
    var sql = `INSERT INTO Enterprise VALUES (
    ${req.Enterprise_ID}, 
    '${req.Enterprise_Name}',
    '${req.Enterprise_Avatar}',
    '${req.Enterprise_Address}',
    '${req.Enterprise_Email}',
    '${req.Enterprise_Hotline}',
    '${req.Enterprise_Description}',
    '${req.Enterprise_Username}')`
    sql = sql.replace(/(\r\n|\n|\t|\r)/gm, "")
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results)
        res.send(results)
    })
}

exports.updateEnterprise = function(req, res) {
    req = req.body
    var sql = `UPDATE Enterprise
    SET 
    Enterprise_Name = '${req.Enterprise_Name}',
    Enterprise_Avatar = '${req.Enterprise_Avatar}',
    Enterprise_Address = '${req.Enterprise_Address}',
    Enterprise_Email = '${req.Enterprise_Email}',
    Enterprise_Hotline = '${req.Enterprise_Hotline}',
    Enterprise_Description = '${req.Enterprise_Description}',
    Enterprise_Username = '${req.Enterprise_Username}'
    WHERE Enterprise_ID = ${req.Enterprise_ID};
    `
    sql = sql.replace(/(\r\n|\n|\t|\r)/gm, "")
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results)
        res.send(results)
    })
}

exports.deleteEnterpriseWithID = function(id, res) {
    var sql = `DELETE FROM Enterprise WHERE Enterprise_ID = ${id}`
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results)
        res.send(results)
    })
}


exports.listAllWorkers = function(req, res) {
    var sql = 'SELECT * FROM Worker';
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results)
            // res.send(results)
        res.end(`temp=${JSON.stringify(results)}`)
    })
}

exports.listWorkerWithID = function(id, res) {
    var sql = `SELECT * FROM Worker WHERE Worker.Worker_ID = ${id}`;
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results[0])
        res.send(results[0])
    })
}

exports.addWorker = function(req, res) {
    req = req.body
    var sql = `INSERT INTO Worker VALUES (
    ${req.Worker_ID}, 
    ${req.Worker_Enterprise},
    ${req.Worker_Store},
    '${req.Worker_Name}',
    '${req.Worker_ICNumber}',
    '${req.Worker_Phone}')`
    sql = sql.replace(/(\r\n|\n|\t|\r)/gm, "")
    conn.conn.query(sql, (err, results) => {
        console.log(results)
        if (err) throw err;
        res.send(results)
    })
}

exports.updateWorker = function(req, res) {
    req = req.body
    var sql = `UPDATE Worker
    SET 
    Worker_Name = '${req.Worker_Name}',
    Worker_Store = '${req.Worker_Store}',
    Worker_Enterprise = '${req.Worker_Enterprise}',
    Worker_ICNumber = '${req.Worker_ICNumber}',
    Worker_Phone = '${req.Worker_Phone}',
    WHERE Worker_ID = ${req.Worker_ID};
    `
    sql = sql.replace(/(\r\n|\n|\t|\r)/gm, "")
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results)
        res.send(results)
    })
}

exports.deleteWorkerWithID = function(id, res) {
    var sql = `DELETE FROM Worker WHERE Worker_ID = ${id}`
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results)
        res.send(results)
    })
}

exports.listWorkersWithEnterID = function(id, res) {
    var sql = `SELECT Worker_ID, Worker_Name, Worker_Store, Enterprise_Name
        FROM Worker, Enterprise
        WHERE Worker_Enterprise = ${id} AND Enterprise_ID = Worker_Enterprise
        ORDER BY Worker_Store, Worker_Name ASC;`
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results)
        res.send(results)
    })
}

exports.listWorkersOnDate = function(req, res) {
    var sql = `SELECT Worker_ID, Worker_Name, Worker_Store, Worker_Enterprise 
        FROM Worker, Timesheet 
        WHERE Worker_Store = Timesheet_Store 
                AND Timesheet_Worker = Worker_ID 
                AND Timesheet_Enterprise = Worker_Enterprise 
                AND Timesheet_Date = '2020-12-31' 
        ORDER BY Worker_Name DESC;`
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results)
        res.send(results)
    })
}

exports.listWorkersWithExpireDayAfter = function(req, res) {
    var sql = `CALL ExpiredList('2020-02-01');`
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results)
        res.send(results)
    })
}

exports.listWorkersWithMoreWorkdate = function(workdate, res) {
    var sql = `SELECT Worker_ID, Worker_Store, COUNT(Timesheet_WorkerNo) AS "WorkDate"
        FROM Timesheet, Worker
        WHERE Timesheet_Worker = Worker_ID 
                AND Worker_Store = Timesheet_Store 
                AND Timesheet_Enterprise = Worker_Enterprise
        GROUP BY Worker_ID, Worker_Store
        HAVING WorkDate > ${workdate}
        ORDER BY Worker_ID;`
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results)
        res.send(results)
    })
}


exports.listAllStaffs = function(req, res) {
    var sql = 'SELECT * FROM Staff';
    conn.conn.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results)
            // res.send(results)
        res.end(`temp=${JSON.stringify(results)}`)
    })
}