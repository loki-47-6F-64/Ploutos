# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130927214553) do

# Could not dump table "fixed_costs" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "incomes", force: true do |t|
    t.integer "user_id"
    t.decimal "amount"
    t.text    "description"
  end

  add_index "incomes", ["user_id"], name: "index_incomes_on_user_id"

  create_table "sudden_checks", force: true do |t|
    t.integer "user_id"
    t.date    "when"
    t.decimal "amount"
    t.text    "description"
    t.integer "is_income"
  end

  add_index "sudden_checks", ["user_id"], name: "index_sudden_checks_on_user_id"

  create_table "types", force: true do |t|
    t.integer "user_id"
    t.string  "name"
  end

  add_index "types", ["user_id"], name: "index_types_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "savings"
  end

end
