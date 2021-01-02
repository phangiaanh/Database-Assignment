var model = require('../models/model')

exports.listAllEnterprises = function(req, res) {
    // model.listAllEnterprises(req, res)
    var obj ={
        actor : 'mikami yua',
        code : 'GPMN-3004'
    }
    console.log("accept")
    res.end(`a=${JSON.stringify(obj)}`)
}

exports.listEnterpriseWithID = function(req, res) {
    var id = req.params.id;
    model.listEnterpriseWithID(id, res)
}