'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class ProductColor extends Model {
  color () {
    return this.belongsTo('App/Models/Color', 'color_id', 'id')
  }
}

module.exports = ProductColor
