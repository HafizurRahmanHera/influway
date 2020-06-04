'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class CustomProductLink extends Model {
  product () {
    return this.belongsTo('App/Models/Product', 'linked_product_id', 'id')
  }
  
}

module.exports = CustomProductLink
