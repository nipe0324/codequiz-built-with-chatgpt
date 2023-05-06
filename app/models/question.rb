class Question < ApplicationRecord
  belongs_to :category
  belongs_to :difficulty
  has_many :question_choices, dependent: :destroy

  validates :content, presence: true
  validates :answer, presence: true
end
