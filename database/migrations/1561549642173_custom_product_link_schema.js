'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class CustomProductLinkSchema extends Schema {
  up () {
    this.create('custom_product_links', (table) => {
      table.increments()
      table.integer('x_cor')
      table.integer('y_cor')
      table.integer('linked_product_id').unsigned()
      table.foreign('linked_product_id').references('products.id').onDelete('cascade')
      table.integer('custom_product_id').unsigned()
      table.foreign('custom_product_id').references('custom_products.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('custom_product_links')
  }
}

module.exports = CustomProductLinkSchema
