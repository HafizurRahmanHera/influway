'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class ProductSubcategory extends Model {
  subcategory () {
    return this.belongsTo('App/Models/Subcategory', 'subcategory_id', 'id')
  }
}

module.exports = ProductSubcategory
