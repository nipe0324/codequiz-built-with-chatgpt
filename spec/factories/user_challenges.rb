FactoryBot.define do
  factory :user_challenge do
    association :user
    association :category
    association :difficulty
    total_quizzes { 10 }
    correct_quizzes { 5 }
    current_quizzes { 5 }
  end
end
