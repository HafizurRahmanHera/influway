'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class CollageLinkedProductSchema extends Schema {
  up () {
    this.create('collage_linked_products', (table) => {
      table.increments()
      table.integer('x')
      table.integer('y')
      table.integer('w')
      table.integer('h')
      table.integer('i').unsigned()
      table.foreign('i').references('products.id').onDelete('cascade')
      table.integer('collage_id').unsigned()
      table.foreign('collage_id').references('collages.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('collage_linked_products')
  }
}

module.exports = CollageLinkedProductSchema
