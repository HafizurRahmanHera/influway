'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Follow extends Model {

  followerUser(){
    return this.belongsTo('App/Models/User', 'following_user_id', 'id')
  }

  followingUser(){
    return this.belongsTo('App/Models/User', 'follower_user_id', 'id')
  }


}

module.exports = Follow
