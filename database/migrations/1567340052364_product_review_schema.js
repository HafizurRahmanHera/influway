'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class ProductReviewSchema extends Schema {
  up () {
    this.create('product_reviews', (table) => {
      table.increments()
      table.integer('rating')
      table.text('comment')
      table.integer('product_id').unsigned()
      table.foreign('product_id').references('products.id').onDelete('cascade')
      table.integer('user_id').unsigned()
      table.foreign('user_id').references('users.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('product_reviews')
  }
}

module.exports = ProductReviewSchema
