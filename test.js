var mysql = require('mysql2')

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "Bachkhoamt1@",
    database: "Test"
  });

  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!!!")
  });


var express = require('express');
var app = express();
app.listen(9999,function(){
    console.log('Node server running @ http://localhost:3000')
});


app.get('/something', (req, res) => {
  var sql = 'SELECT * FROM Test.Enterprise';
  con.query(sql, function(err, results) {
    if (err) throw err;
    res.send(results);
  })
})
