FactoryBot.define do
  factory :question do
    association :category
    association :difficulty
    creator { association(:user) }
    sequence(:question) { |n| "Question #{n}" }
    explanation { "Explanation" }

    trait :with_choices do
      after(:create) do |question|
        create_list(:question_choice, 1, :correct, question: question)
        create_list(:question_choice, 3, :incorrect, question: question)
      end
    end
  end
end
