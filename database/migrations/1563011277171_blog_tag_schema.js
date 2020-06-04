'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class BlogTagSchema extends Schema {
  up () {
    this.create('blog_tags', (table) => {
      table.increments()
      table.string('tag')
      table.integer('blog_id').unsigned()
      table.foreign('blog_id').references('blogs.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('blog_tags')
  }
}

module.exports = BlogTagSchema
