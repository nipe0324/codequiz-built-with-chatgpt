class QuestionChoice < ApplicationRecord
  belongs_to :question

  validates :explanation, presence: true
  validates :is_correct, inclusion: { in: [true, false] }
end
