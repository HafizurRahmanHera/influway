'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class FeedSchema extends Schema {
  up () {
    this.create('feeds', (table) => {
      table.increments()
      table.string('type').comment('lookbook, collage, blog, vlog')
      table.integer('lookbook_id').unsigned()
      table.foreign('lookbook_id').references('custom_products.id').onDelete('cascade')
      table.integer('collage_id').unsigned()
      table.foreign('collage_id').references('collages.id').onDelete('cascade')
      table.integer('blog_id').unsigned()
      table.foreign('blog_id').references('blogs.id').onDelete('cascade')
      table.integer('vlog_id').unsigned()
      table.foreign('vlog_id').references('vlogs.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('feeds')
  }
}

module.exports = FeedSchema
