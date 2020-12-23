module.exports = (app, conn) => {
    var controller = require('../controllers/controllers')

    app.route('/something')
    .get(controller.listAllEnterprises)

    app.route('/something/:id')
    .get(controller.listEnterpriseWithID)
    
}