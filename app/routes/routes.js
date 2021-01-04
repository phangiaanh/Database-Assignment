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
    
    
}