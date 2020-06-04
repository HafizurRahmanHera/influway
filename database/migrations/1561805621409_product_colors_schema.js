'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class ProductColorsSchema extends Schema {
  up () {
    this.create('product_colors', (table) => {
      table.increments()
      table.integer('color_id').unsigned()
      table.foreign('color_id').references('colors.id')
      table.integer('product_id').unsigned()
      table.foreign('product_id').references('products.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('product_colors')
  }
}

module.exports = ProductColorsSchema
