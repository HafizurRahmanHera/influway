'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class TokenTransactionSchema extends Schema {
  up () {
    this.create('token_transactions', (table) => {
      table.increments()
      table.string('action_type')
      table.integer('token')
      table.integer('feed_id').unsigned()
      table.foreign('feed_id').references('feeds.id').onDelete('cascade')
      table.integer('user_id').unsigned()
      table.foreign('user_id').references('users.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('token_transactions')
  }
}

module.exports = TokenTransactionSchema
