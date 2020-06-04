'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class VlogTagSchema extends Schema {
  up () {
    this.create('vlog_tags', (table) => {
      table.increments()
      table.string('tag')
      table.integer('vlog_id').unsigned()
      table.foreign('vlog_id').references('vlogs.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('vlog_tags')
  }
}

module.exports = VlogTagSchema
