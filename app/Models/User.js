'use strict'

const Model = use('Model')
const Database = use('Database')

class User extends Model {
  static boot () {
    super.boot()

    /**
     * A hook to bash the user password before saving
     * it to the database.
     *
     * Look at `app/Models/Hooks/User.js` file to
     * check the hashPassword method
     */
    this.addHook('beforeSave', 'User.hashPassword')
  }

  /**
   * A relationship on tokens is required for auth to
   * work. Since features like `refreshTokens` or
   * `rememberToken` will be saved inside the
   * tokens table.
   *
   * @method tokens
   *
   * @return {Object}
   */
  tokens () {
    return this.hasMany('App/Models/Token')
  }

  static get hidden () {
    // return ['password', 'passwordToken', 'accountActivationToken']
    // return ['password']
    // return ['password','email']
    return ['password','email','ethereum_address']
  }

  shopCategory () {
    return this.belongsTo('App/Models/ProductCategory', 'shop_category_id', 'id')
  }

  receivedTokens(){
    // return this.hasOne('App/Models/TokenTransaction', 'id', 'user_id').select('user_id', Database.raw('sum(token) as tokens')).where('action_type','created').orWhere('action_type','received')
    // return this.hasOne('App/Models/TokenTransaction', 'id', 'user_id').select('user_id','feed_id', Database.raw('sum(token) as tokens'))
    return this.hasOne('App/Models/TokenTransaction', 'id', 'user_id').select('user_id', Database.raw('sum(token) as tokens') )
  }
  deductedTokens(){
    // return this.hasOne('App/Models/TokenTransaction', 'id', 'user_id').select('user_id','feed_id', Database.raw('sum(token) as tokens'))
    return this.hasOne('App/Models/TokenTransaction', 'id', 'user_id').select('user_id', Database.raw('sum(token) as tokens'))
  }

  follower(){
    return this.hasOne('App/Models/Follow', 'id', 'following_user_id')
  }
  following(){
    return this.hasOne('App/Models/Follow', 'id', 'follower_user_id')
  }

  verificationForm(){
    return this.hasOne('App/Models/VerificationForm', 'id', 'user_id')
  }

  subcategory(){
    return this.hasMany('App/Models/StoreSubcategory', 'id', 'store_id')
  }


}

module.exports = User
