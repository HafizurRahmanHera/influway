'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class StoreSubcategory extends Model {
  subcategory () {
    return this.belongsTo('App/Models/Subcategory', 'subcategory_id', 'id')
  }
}

module.exports = StoreSubcategory
