# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_09_24_065039) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidatos", force: :cascade do |t|
    t.string "nome", null: false
    t.string "email", null: false
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidaturas", force: :cascade do |t|
    t.bigint "candidato_id", null: false
    t.bigint "vaga_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidato_id"], name: "index_candidaturas_on_candidato_id"
    t.index ["vaga_id"], name: "index_candidaturas_on_vaga_id"
  end

  create_table "empregadors", force: :cascade do |t|
    t.string "nome", null: false
    t.string "email", null: false
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.index ["username"], name: "index_usuarios_on_username", unique: true
  end

  create_table "vagas", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "empregador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empregador_id"], name: "index_vagas_on_empregador_id"
  end

  add_foreign_key "candidaturas", "candidatos"
  add_foreign_key "candidaturas", "vagas"
  add_foreign_key "vagas", "empregadors"
end
