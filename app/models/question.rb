class Question < ApplicationRecord
  belongs_to :category
  belongs_to :difficulty
  has_many :question_choices, dependent: :destroy

  validates :question, presence: true
  validates :explanation, presence: true
end
