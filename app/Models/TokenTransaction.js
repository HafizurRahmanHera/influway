'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class TokenTransaction extends Model {
  user(){
    return this.belongsTo('App/Models/User', 'user_id' , 'id')
  }

  feedItem(){
    return this.belongsTo('App/Models/Feed', 'feed_id', 'id')
  }
}

module.exports = TokenTransaction
