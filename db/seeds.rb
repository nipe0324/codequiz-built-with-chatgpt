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

Category.all.to_a.product(Difficulty.all).each_with_index do |(category, difficulty), i|
  question = Question.find_or_create_by(id: i + 1) do |q|
    q.category = category
    q.difficulty = difficulty
    q.content = "#{category.name}の#{difficulty.name}のクエスチョン"
    q.answer = "Answer #{i}"
  end

  next if question.question_choices.present?

  4.times do |i|
    question.question_choices.create!(
      content: "Choice #{i+1}.",
      is_correct: (i == 0)
    )
  end
end
