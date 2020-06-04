'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class ProductSize extends Model {
  size () {
    return this.belongsTo('App/Models/Size', 'size_id', 'id')
  }
}

module.exports = ProductSize
