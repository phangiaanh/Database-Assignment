module.exports = (app, conn) => {
    var controller = require('../controllers/controllers')

    // Route for account
    app.route('/account')
    .get(controller.checkAccount)

    // Route for enterprise [Phan Gia Anh]
    app.route('/enterprise')
    .get(controller.listAllEnterprises)
    .post(controller.addEnterprise)
    .put(controller.updateEnterprise)

    app.route('/enterprise/:id')
    .get(controller.listEnterpriseWithID)
    .delete(controller.deleteEnterpriseWithID)
    
    app.route('/enterprise/:id/snum')
    .get(controller.getStoreNumber)

    app.route('/enterprise/:id/active')
    .get(controller.getActiveStore)

    app.route('/enterprise/:id/inactive')
    .get(controller.getInactiveStore)

    app.route('/enterprise_area')
    .get(controller.checkArea)



    // Route for store [Vo Nguyen Phi Long]
    app.route('/enterprises/notVL')
    .get(controller.getEntNotInVL_Has_lt4_store)

    app.route('/enterprises/:id/stores')
    .get(controller.getAllStoreByEntID)

    app.route('/enterprises/:id/stores/count')
    .get(controller.getStoreCountByID)

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
    



    // Route for Product and Batch [Nguyen Ly Phuong Thanh]
    app.route('/enterprises/mstore')
    .get(controller.getStoreOfEntNameStartedByM)
    
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

    app.route('/enterprises/:id/workers/count')
    .get(controller.getNumberOfWorkerByEntID)





    // Route for Worker [Nguyen Phuoc Sang]
    app.route('/worker')
        .get(controller.listAllWorkers)
        .post(controller.addWorker)
        .put(controller.updateWorker)

    app.route('/worker/:id')
        .get(controller.listWorkerWithID)
        .delete(controller.deleteWorkerWithID)

    app.route('/worker/enterpriseid/:id')
        .get(controller.listWorkersWithEnterID)

    app.route('/worker/ondate')
        .get(controller.listWorkersOnDate)

    app.route('/worker/expireday/')
        .get(controller.listWorkersWithExpireDayAfter)

    app.route('/worker/workdate/:workdate')
        .get(controller.listWorkersWithMoreWorkdate)


    // Route for Staff
    app.route('/Staff')
        .get(controller.listAllStaffs)


}