class Question < ApplicationRecord
  belongs_to :category
  belongs_to :difficulty
  belongs_to :creator, class_name: 'User'

  validates :question, presence: true
  validates :explanation, presence: true
end
