'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class CustomProductSchema extends Schema {
  up () {
    this.create('custom_products', (table) => {
      table.increments()
      table.string('title')
      table.string('image')
      table.integer('user_id').unsigned()
      table.foreign('user_id').references('users.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('custom_products')
  }
}

module.exports = CustomProductSchema
