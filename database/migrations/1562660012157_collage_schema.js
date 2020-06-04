'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class CollageSchema extends Schema {
  up () {
    this.create('collages', (table) => {
      table.increments()
      table.integer('user_id').unsigned()
      table.foreign('user_id').references('users.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('collages')
  }
}

module.exports = CollageSchema
