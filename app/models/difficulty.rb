class Difficulty < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
