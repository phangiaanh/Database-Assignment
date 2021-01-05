var model = require('../models/model')

// [PHAN GIA ANH]
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

exports.getStoreNumber = function(req, res) {
    let id = req.params.id
    model.getStoreNumber(id, res)    
}

exports.getActiveStore = function(req, res) {
    let id = req.params.id
    model.getActiveStore(id, res)
}

exports.getInactiveStore = function(req, res) {
    let id = req.params.id
    model.getInactiveStore(id, res)
}

exports.checkArea = function(req, res) {
    let area = req.query.area
    model.checkArea(area, res)
}


// [VO NGUYEN PHI LONG]

exports.getEntNotInVL_Has_lt4_store = function(req, res) {
    model.getEntNotInVL_Has_lt4_store(req, res)
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




// [NGUYEN LY PHUONG THANH]
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





// [NGUYEN PHUOC SANG]
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

exports.listWorkersWithEnterID = function(req, res) {
    let id = req.params.id;
    model.listWorkersWithEnterID(id, res);
}

exports.listWorkersOnDate = function(req, res) {
    model.listWorkersOnDate(req, res)
}

exports.listWorkersWithExpireDayAfter = function(req, res) {
    model.listWorkersWithExpireDayAfter(req, res)
}

exports.listWorkersWithMoreWorkdate = function(req, res) {
    let workdate = req.params.workdate;
    model.listWorkersWithMoreWorkdate(workdate, res)
}

exports.listAllStaffs = function(req, res) {
    model.listAllStaffs(req, res);
}