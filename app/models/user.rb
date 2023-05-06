class User < ApplicationRecord
  include Clearance::User

  has_many :questions, foreign_key: :creator_id, dependent: :destroy
  has_many :user_challenges, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
end
