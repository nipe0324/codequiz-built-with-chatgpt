FactoryBot.define do
  factory :question_choice do
    association :question
    sequence(:explanation) { |n| "Explanation #{n}" }

    trait :correct do
      is_correct { true }
    end

    trait :incorrect do
      is_correct { false }
    end
  end
end
