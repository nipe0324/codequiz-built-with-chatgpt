FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "username#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password123" }
  end
end
