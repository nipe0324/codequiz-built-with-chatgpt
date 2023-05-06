# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

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
