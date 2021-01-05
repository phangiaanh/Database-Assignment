module.exports = (app, conn) => {
    var controller = require('../controllers/controllers')

    // Route for account
    app.route('/account')
        .get(controller.checkAccount)

    // Route for enterprise 
    app.route('/enterprise')
        .get(controller.listAllEnterprises)
        .post(controller.addEnterprise)
        .put(controller.updateEnterprise)

    app.route('/enterprise/:id')
        .get(controller.listEnterpriseWithID)
        .delete(controller.deleteEnterpriseWithID)


    // Route for store








    // Route for Worker
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