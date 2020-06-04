'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class VerificationFormSchema extends Schema {
  up () {
    this.create('verification_forms', (table) => {
      table.increments()
      table.string('first_name')
      table.string('last_name')
      table.string('email')
      table.string('phone')
      table.date('birth_date')
      table.string('telegram_username')
      table.string('address_line_1')
      table.string('address_line_2')
      table.string('city')
      table.string('state')
      table.integer('country_id')
      table.string('zip_code')
      table.string('document_type')
      table.integer('wallet_id')
      table.string('address_for_tokens')
      table.string('admin_note')
      table.timestamp('checked_on_date')
      table.integer('user_id').unsigned()
      table.foreign('user_id').references('users.id').onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('verification_forms')
  }
}

module.exports = VerificationFormSchema
