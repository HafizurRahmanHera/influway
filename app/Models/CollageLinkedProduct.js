'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class CollageLinkedProduct extends Model {
  product () {
    return this.belongsTo('App/Models/Product', 'i', 'id')
  }
}

module.exports = CollageLinkedProduct
