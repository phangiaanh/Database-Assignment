module.exports.connect = (config) => {
    var mysql = require('mysql2');

    var token = mysql.createConnection({
           host: config.HOST,
        user: config.USER,
        password: config.PASSWORD,
        database: config.DB
    });
    
    token.connect(function(err) {
        if (err) throw err;
        console.log("Connected!!!")
    });

    token.query('USE A;')

    module.exports.conn = token;
}




