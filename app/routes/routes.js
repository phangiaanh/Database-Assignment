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
        .get(controller.listWorkersWithEnterID)
        .delete(controller.deleteWorkerWithID)

    app.route('/worker/:date')
        .get(controller.listWorkersOnDate)
        .get(controller.listWorkersWithExpireDayAfter)

    app.route('/worker/:workdate')
        .get(controller.listWorkersWithMoreWorkdate)
}