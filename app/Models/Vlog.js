'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Vlog extends Model {
  vlogTags () {
    return this.hasMany('App/Models/VlogTag', 'id', 'vlog_id')
  }
  vlogCategory(){
    return this.belongsTo('App/Models/ProductCategory','category_id', 'id')
  }
  user () {
    return this.belongsTo('App/Models/User', 'user_id', 'id')
  }

  comments () {
    return this.hasMany('App/Models/Comment', 'feed_id', 'feed_id')
  }

  userLike () {
    return this.hasOne('App/Models/Like', 'feed_id', 'feed_id')
  }
  like () {
    return this.hasMany('App/Models/Like', 'feed_id', 'feed_id')
  }
  userDetails () {
    return this.belongsTo('App/Models/VerificationForm', 'user_id', 'id')
  }
}

module.exports = Vlog
