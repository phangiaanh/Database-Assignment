var model = require('../models/model')

exports.listAllEnterprises = function(req, res) {
    model.listAllEnterprises(req, res)
}

exports.listEnterpriseWithID = function(req, res) {
    req.params.id;
    model.listEnterpriseWithID(id, res)
}

exports.checkAccount = function(req, res) {
    var username = req.query.username;
    var password = req.query.password;
    var results = model.checkAccount(username, password, res)
    // res.send(results)
}