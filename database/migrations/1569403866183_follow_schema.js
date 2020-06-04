'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class FollowSchema extends Schema {
  up () {
    this.create('follows', (table) => {
      table.increments()
      table.integer('follower_user_id').unsigned()
      table.foreign('follower_user_id').references('users.id').onDelete('cascade')
      table.integer('following_user_id').unsigned()
      table.foreign('following_user_id').references('users.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('follows')
  }
}

module.exports = FollowSchema
