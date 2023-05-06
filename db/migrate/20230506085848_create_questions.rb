class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :category, null: false, foreign_key: true
      t.references :difficulty, null: false, foreign_key: true
      t.text :content, null: false
      t.text :answer, null: false

      t.timestamps
    end
  end
end
