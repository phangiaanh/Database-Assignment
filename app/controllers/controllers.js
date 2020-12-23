var model = require('../models/model')

exports.listAllEnterprises = function(req, res) {
    model.listAllEnterprises(req, res)
}

exports.listEnterpriseWithID = function(req, res) {
    var id = req.params.id;
    model.listEnterpriseWithID(id, res)
}