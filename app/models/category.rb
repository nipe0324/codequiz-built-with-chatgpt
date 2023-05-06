class Category < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :user_challenges, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
