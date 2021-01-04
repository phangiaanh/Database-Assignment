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


// Worker

exports.listAllWorkers = function(req, res) {
    model.listAllWorkers(req, res)
}

exports.listWorkerWithID = function(req, res) {
    let id = req.params.id;
    model.listWorkerWithID(id, res)
}

exports.addWorker = function(req, res) {
    model.addWorker(req, res)
}

exports.updateWorker = function(req, res) {
    model.updateWorker(req, res)
}

exports.deleteWorkerWithID = function(req, res) {
    let id = req.params.id;
    model.deleteWorkerWithID(id, res)
}