class CreateUserChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :user_challenges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :difficulty, null: false, foreign_key: true
      t.integer :total_quizzes, null: false
      t.integer :correct_quizzes, null: false
      t.integer :current_quizzes, null: false

      t.timestamps
    end
  end
end
