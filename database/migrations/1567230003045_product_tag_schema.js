'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class ProductTagSchema extends Schema {
  up () {
    this.create('product_tags', (table) => {
      table.increments()
      table.string('tag')
      table.integer('product_id').unsigned()
      table.foreign('product_id').references('products.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('product_tags')
  }
}

module.exports = ProductTagSchema
