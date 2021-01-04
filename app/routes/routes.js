module.exports = (app, conn) => {
    var controller = require('../controllers/controllers')

    app.route('/enterprises')
    .get(controller.listAllEnterprises)

    app.route('/enterprises/notVL')
    .get(controller.getEntNotInVL_Has_lt4_store)

    app.route('/enterprises/mstore')
    .get(controller.getStoreOfEntNameStartedByM)

    app.route('/enterprises/:id')
    .get(controller.listEnterpriseWithID)

    app.route('/enterprises/:id/stores')
    .get(controller.getAllStoreByEntID)

    app.route('/enterprises/:id/stores/count')
    .get(controller.getStoreCountByID)

    app.route('/enterprises/:id/workers/count')
    .get(controller.getNumberOfWorkerByEntID)

    app.route('/stores')
    .get(controller.getAllStore)

    app.route('/stores/not/:id')
    .get(controller.getAllStoreAddressExcept)
    
    app.route('/stocks')
    .get(controller.getAllStock)

    app.route('/stocks/mt2')
    .get(controller.getStockSupporting_mt2_Store)

    app.route('/stocks/area/:square')
    .get(controller.getStockAreaLessThan)

    app.route('/batches/mt20')
    .get(controller.getBatchHasQuantity_mt20)

    app.route('/batches/foodmt3k')
    .get(controller.getFoodBatchHasTotalProductCost_mt3000)

    app.route('/enterprises/workers/mt3/:store_ID')
    .get(controller.getEntHas_mt3_WorkerNotWorkIn)

    app.route('/staffs')
    .get(controller.getAllStaff)

    app.route('/staffs/:id')
    .get(controller.getStaffInformation)

    app.route('/accounts/level/:level')
    .get(controller.getNumOfAccountHasSameLevel)

    //PUT
    app.route('/stores/:id/state')
    .put(controller.changeStoreState)

    // POST
    app.route('/certifications')
    .post(controller.addNewCertification)
}