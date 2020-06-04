'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Status extends Model {
  images () {
    return this.hasMany('App/Models/StatusImage', 'id', 'status_id')
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

module.exports = Status
