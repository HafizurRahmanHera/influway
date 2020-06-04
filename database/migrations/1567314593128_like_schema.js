'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class LikeSchema extends Schema {
  up () {
    this.create('likes', (table) => {
      table.increments()
      table.integer('feed_id').unsigned()
      table.foreign('feed_id').references('feeds.id').onDelete('cascade')
      table.integer('user_id').unsigned()
      table.foreign('user_id').references('users.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('likes')
  }
}

module.exports = LikeSchema
