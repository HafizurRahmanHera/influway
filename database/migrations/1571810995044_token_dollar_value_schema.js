'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class TokenDollarValueSchema extends Schema {
  up () {
    this.create('token_dollar_values', (table) => {
      table.increments()
      table.float('value')
      table.timestamps()
    })
  }

  down () {
    this.drop('token_dollar_values')
  }
}

module.exports = TokenDollarValueSchema
