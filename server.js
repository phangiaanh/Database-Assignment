const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
var config = require('./app/config/db.config.js');
var routing = require('./app/routes/routes.js');
var connection = require('./app/models/connection.js');
const app = express();
var path = require('path')

connection.connect(config);
const port = process.env.PORT || 9999;

var corsOptions = {
    origin: "http://localhost:8000",
    
};

routing(app);

app.use(cors());

app.use(bodyParser.json());

app.use(bodyParser.urlencoded({extended: true}));

app.listen(port, ()=>{
    console.log('Server is running on port: ' + port);    
});



