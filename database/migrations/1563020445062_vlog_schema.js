'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class VlogSchema extends Schema {
  up () {
    this.create('vlogs', (table) => {
      table.increments()
      table.string('title')
      table.string('video')
      table.text('text')
      table.integer('user_id').unsigned()
      table.foreign('user_id').references('users.id').onDelete('cascade')
      table.integer('category_id').unsigned()
      table.foreign('category_id').references('product_categories.id').onDelete('set null')
      table.timestamps()
    })
  }

  down () {
    this.drop('vlogs')
  }
}

module.exports = VlogSchema
