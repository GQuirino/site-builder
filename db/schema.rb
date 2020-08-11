# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_11_113904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banners", force: :cascade do |t|
    t.string "background_color"
    t.string "title_color"
    t.bigint "site_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_banners_on_site_id"
  end

  create_table "page_codes", force: :cascade do |t|
    t.text "html"
    t.bigint "site_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_page_codes_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "icon"
    t.string "background_color"
    t.string "title"
    t.boolean "code_rendered", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "widgets", force: :cascade do |t|
    t.string "background_color"
    t.string "title"
    t.string "content"
    t.integer "position"
    t.bigint "site_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["position", "site_id"], name: "index_widgets_on_position_and_site_id"
    t.index ["site_id"], name: "index_widgets_on_site_id"
  end

  add_foreign_key "banners", "sites"
  add_foreign_key "page_codes", "sites"
  add_foreign_key "widgets", "sites"
end
