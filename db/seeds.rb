# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Master Data

[
  { id: 1, name: 'Ruby' },
  { id: 2, name: 'Go' },
  { id: 3, name: 'Rust' }
].each do |category|
  Category.find_or_create_by!(id: category[:id]) do |c|
    c.name = category[:name]
  end
end

[
  { id: 1, name: '初級' },
  { id: 2, name: '中級' },
  { id: 3, name: '上級' }
].each do |difficulty|
  Difficulty.find_or_create_by(id: difficulty[:id]) do |d|
    d.name = difficulty[:name]
  end
end

# Sample quiestions
# TODO: Remove this later.

[
  { id: 1, category_id: 1, difficulty_id: 1, question: 'What does the following code output? 1', explanation: 'Explanation for question 1.' },
  { id: 2, category_id: 1, difficulty_id: 1, question: 'What does the following code output? 2', explanation: 'Explanation for question 2.' },
  { id: 3, category_id: 1, difficulty_id: 1, question: 'What does the following code output? 3', explanation: 'Explanation for question 3.' },
  { id: 4, category_id: 1, difficulty_id: 1, question: 'What does the following code output? 4', explanation: 'Explanation for question 4.' },
  { id: 5, category_id: 1, difficulty_id: 1, question: 'What does the following code output? 5', explanation: 'Explanation for question 5.' },
].each do |question|
  question = Question.find_or_create_by(id: question[:id]) do |q|
    q.category = Category.find(question[:category_id])
    q.difficulty = Difficulty.find(question[:difficulty_id])
    q.question = question[:question]
    q.explanation = question[:explanation]
  end

  next if question.question_choices.present?

  4.times do |i|
    QuestionChoice.create!(
      question: question,
      explanation: "Choice #{i+1}.",
      is_correct: (i == 0)
    )
  end
end
