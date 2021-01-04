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
    
}