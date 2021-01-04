var model = require('../models/model')

exports.listAllEnterprises = function(req, res) {
    model.listAllEnterprises(req, res)
}

exports.getEntNotInVL_Has_lt4_store = function(req, res) {
    model.getEntNotInVL_Has_lt4_store(req, res)
}

exports.listEnterpriseWithID = function(req, res) {
    var id = req.params.id;
    model.listEnterpriseWithID(id, res)
}

exports.getAllStore = function(req, res) {
    model.getExactStoreAddress(req, res)
}

exports.getAllStoreByEntID = function(req, res) {
    var id = req.params.id;
    model.getAllStoreByEntID(id, res)
}

exports.getStoreCountByID = function(req, res) {
    var id = req.params.id;
    model.getStoreCountByID(id, res)
}
//
exports.getAllStoreAddressExcept = function(req, res) {
    var id = req.params.id;
    model.getAllStoreAddressExcept(id, res)
}


exports.getAllStock = function(req, res) {
    model.getAllStock(req, res)
}

exports.getStockSupporting_mt2_Store = function(req, res) {
    model.getStockSupporting_mt2_Store(req, res)
}

exports.getStoreCountByID = function(req, res) {
    var id = req.params.id;
    model.getStoreCountByID(id, res)
}

exports.getStockAreaLessThan = function(req, res) {
    var square = req.params.square
    model.getStockAreaLessThan(square, res);
}