'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class ProductSizesSchema extends Schema {
  up () {
    this.create('product_sizes', (table) => {
      table.increments()
      table.integer('size_id').unsigned()
      table.foreign('size_id').references('sizes.id')
      table.integer('product_id').unsigned()
      table.foreign('product_id').references('products.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('product_sizes')
  }
}

module.exports = ProductSizesSchema
