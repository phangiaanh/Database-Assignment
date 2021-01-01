module.exports = (app, conn) => {
    var controller = require('../controllers/controllers')

    // Route for enterprise 
    app.route('/something')
    .get(controller.listAllEnterprises)
    .post

    app.route('/something/:id')
    .get(controller.listEnterpriseWithID)

    

    // Route for store
    
    
}