module.exports = (app, conn) => {
    var controller = require('../controllers/controllers')

    // Route for account
    app.route('/account')
    .get(controller.checkAccount)

    // Route for enterprise 
    app.route('/something')
    .get(controller.listAllEnterprises)
    

    app.route('/something/:id')
    .get(controller.listEnterpriseWithID)

    

    // Route for store
    
    
}