class User < ApplicationRecord
  include Clearance::User

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
end
