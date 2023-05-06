# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

categories = [
  { id: 1, name: 'Ruby' },
  { id: 2, name: 'Go' },
  { id: 3, name: 'Rust' }
]

categories.each do |category|
  Category.find_or_create_by!(id: category[:id]) do |c|
    c.name = category[:name]
  end
end
