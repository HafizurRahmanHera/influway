'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class ProductImagesSchema extends Schema {
  up () {
    this.create('product_images', (table) => {
      table.increments()
      table.string('image')
      table.integer('product_id').unsigned()
      table.foreign('product_id').references('products.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('product_images')
  }
}

module.exports = ProductImagesSchema
