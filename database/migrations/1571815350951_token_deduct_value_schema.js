'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class TokenDeductValueSchema extends Schema {
  up () {
    this.create('token_deduct_values', (table) => {
      table.increments()
      table.integer('lookbook')
      table.integer('collage')
      table.integer('blog')
      table.integer('vlog')
      table.integer('user_like_deducted_value')
      table.integer('owner_like_removed_value')
      table.timestamps()
    })
  }

  down () {
    this.drop('token_deduct_values')
  }
}

module.exports = TokenDeductValueSchema
