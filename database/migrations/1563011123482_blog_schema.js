'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class BlogSchema extends Schema {
  up () {
    this.create('blogs', (table) => {
      table.increments()
      table.string('title')
      table.string('feature_image')
      table.text('text')
      table.integer('user_id').unsigned()
      table.foreign('user_id').references('users.id').onDelete('cascade')
      table.integer('category_id').unsigned()
      table.foreign('category_id').references('product_categories.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('blogs')
  }
}

module.exports = BlogSchema
