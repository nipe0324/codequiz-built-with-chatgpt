class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :category, null: false, foreign_key: true
      t.references :difficulty, null: false, foreign_key: true
      t.text :question, null: false
      t.text :explanation, null: false

      t.timestamps
    end
  end
end
