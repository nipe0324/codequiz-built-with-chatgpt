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

ActiveRecord::Schema[7.0].define(version: 2023_05_06_090243) do
  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "difficulties", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_difficulties_on_name", unique: true
  end

  create_table "question_choices", charset: "utf8mb4", collation: "utf8mb4_0900_as_cs", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.text "explanation", null: false
    t.boolean "is_correct", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_choices_on_question_id"
  end

  create_table "questions", charset: "utf8mb4", collation: "utf8mb4_0900_as_cs", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "difficulty_id", null: false
    t.bigint "creator_id", null: false
    t.text "question", null: false
    t.text "explanation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_questions_on_category_id"
    t.index ["creator_id"], name: "index_questions_on_creator_id"
    t.index ["difficulty_id"], name: "index_questions_on_difficulty_id"
  end

  create_table "user_challenges", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.bigint "difficulty_id", null: false
    t.integer "total_quizzes", null: false
    t.integer "correct_quizzes", null: false
    t.integer "current_quizzes", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_user_challenges_on_category_id"
    t.index ["difficulty_id"], name: "index_user_challenges_on_difficulty_id"
    t.index ["user_id"], name: "index_user_challenges_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
  end

  add_foreign_key "question_choices", "questions"
  add_foreign_key "questions", "categories"
  add_foreign_key "questions", "difficulties"
  add_foreign_key "questions", "users", column: "creator_id"
  add_foreign_key "user_challenges", "categories"
  add_foreign_key "user_challenges", "difficulties"
  add_foreign_key "user_challenges", "users"
end
