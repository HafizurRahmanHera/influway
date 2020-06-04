'use strict'



/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')
const Database = use('Database')

class Product extends Model {
  productCategory(){
    return this.belongsTo('App/Models/ProductCategory','category_id', 'id')
  }
  productImages(){
    return this.hasMany('App/Models/ProductImage', 'id', 'product_id')
  }
  productSizes(){
    return this.hasMany('App/Models/ProductSize', 'id', 'product_id')
  }
  productColors(){
    return this.hasMany('App/Models/ProductColor', 'id', 'product_id')
  }
  productTags(){
    return this.hasMany('App/Models/ProductTag', 'id', 'product_id')
  }
  userReview(){
    return this.hasOne('App/Models/ProductReview', 'id', 'product_id')
  }
  allReviews(){
    return this.hasMany('App/Models/ProductReview', 'id', 'product_id')   .orderBy('id','desc')
  }
  rating () {
    return this.hasOne('App/Models/ProductReview', 'id', 'product_id').select( 'product_id', Database.raw('(cast(AVG(rating) as decimal(10,2))) AS averageRating'), Database.raw('(cast(sum(rating) as decimal(10,2))) AS totalRating'), Database.raw('(cast(count(rating) as decimal(10,2))) AS countRating'))
  }
  totalRating () {
    return this.hasMany('App/Models/ProductReview', 'id', 'product_id')
  }

  subcategory () {
    return this.hasMany('App/Models/ProductSubcategory', 'id', 'product_id')
  }

}

module.exports = Product
