class User < ApplicationRecord
  include Clearance::User

  validate :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
end
