var model = require('../models/model')


exports.checkAccount = function(req, res) {
    var username = req.query.user;
    var password = req.query.pwd;
    var enter = req.query.enterprise;
    console.log(username, password, enter)
    var results = model.checkAccount(username, password, enter, res)
}

exports.listAllEnterprises = function(req, res) {
    model.listAllEnterprises(req, res)
}

exports.listEnterpriseWithID = function(req, res) {
    let id = req.params.id;
    model.listEnterpriseWithID(id, res)
}

exports.addEnterprise = function(req, res) {
    model.addEnterprise(req, res)
}

exports.updateEnterprise = function(req, res) {
    model.updateEnterprise(req, res)
}

exports.deleteEnterpriseWithID = function(req, res) {
    let id = req.params.id
    model.deleteEnterpriseWithID(id, res)
}