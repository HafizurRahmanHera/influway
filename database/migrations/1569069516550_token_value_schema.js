'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class TokenValueSchema extends Schema {
  up () {
    this.create('token_values', (table) => {
      table.increments()
      table.integer('lookbook')
      table.integer('collage')
      table.integer('blog')
      table.integer('vlog')
      table.timestamps()
    })
  }

  down () {
    this.drop('token_values')
  }
}

module.exports = TokenValueSchema
