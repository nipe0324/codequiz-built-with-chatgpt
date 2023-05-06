FactoryBot.define do
  factory :difficulty do
    sequence(:name) { |n| "name#{n}" }
  end
end
