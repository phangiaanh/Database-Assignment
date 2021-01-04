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

// THANH

exports.getStoreOfEntNameStartedByM = function(req, res) {
    model.getStoreOfEntNameStartedByM(req, res);
}

exports.getBatchHasQuantity_mt20 = function(req, res) {
    model.getBatchHasQuantity_mt20(req, res);
}

exports.getFoodBatchHasTotalProductCost_mt3000 = function(req, res) {
    model.getFoodBatchHasTotalProductCost_mt3000(req, res);
}

exports.getEntHas_mt3_WorkerNotWorkIn = function(req, res) {
    var store_ID = req.params.store_ID
    model.getEntHas_mt3_WorkerNotWorkIn(store_ID, res);
}

exports.getAllStaff = function(req, res) {
    model.getAllStaff(req, res);
}

exports.getStaffInformation = function(req, res) {
    var id = req.params.id
    model.getStaffInformation(id, res);
}

exports.getNumOfAccountHasSameLevel = function(req, res) {
    var level = req.params.level
    model.getNumOfAccountHasSameLevel(level, res);
}

exports.getNumberOfWorkerByEntID = function(req, res) {
    var id = req.params.id
    model.getNumberOfWorkerByEntID(id, res);
}

//PUT
exports.changeStoreState = function(req, res) {
    model.changeStoreState(req, res);
}

//POST
exports.addNewCertification = function(req, res) {
    console.log(req.body, req.params);
    model.addNewCertification(req, res);
}