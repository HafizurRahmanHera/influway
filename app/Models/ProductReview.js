'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class ProductReview extends Model {
  user(){
    return this.belongsTo('App/Models/User','user_id', 'id')
  }
  product(){
    return this.belongsTo('App/Models/Product','product_id', 'id')
  }
}

module.exports = ProductReview
