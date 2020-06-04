'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Feed extends Model {
  lookbook(){
    return this.hasOne('App/Models/CustomProduct', 'id', 'feed_id')
  }
  collage(){
    return this.hasOne('App/Models/Collage', 'id', 'feed_id')
  }
  blog(){
    return this.hasOne('App/Models/Blog', 'id', 'feed_id')
  }
  vlog(){
    return this.hasOne('App/Models/Vlog', 'id', 'feed_id')
  }
  status(){
    return this.hasOne('App/Models/Status', 'id', 'feed_id')
  }
  userLike () {
    return this.hasOne('App/Models/Like', 'id', 'feed_id')
  }
  like () {
    return this.hasMany('App/Models/Like', 'id', 'feed_id')
  }

}

module.exports = Feed
