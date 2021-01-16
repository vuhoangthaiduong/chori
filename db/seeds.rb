require 'faker'

User.create!(
  first_name: "thai",
  last_name: "duong",
  user_name: first_name.concat(last_name),
  email: first_name.concat(last_name) + "@gmail.com",
  password: "abcdef",
  password_confirmation: "abcdef")

50.times do
  name = Faker::Food.dish
  info = Faker::Lorem.paragraph
  instruction = Faker::Food.description
  difficulty = rand(1..5)
  Recipe.create!(
    name: name,
    info: info,
    instruction: instruction,
    difficulty: difficulty
  )
end

100.times do
  name = Faker::Food.ingredient
  info = Faker::Lorem.paragraph
  group = Faker::Lorem.word
  Ingredient.create!(
    name: name,
    info: info,
    group: group
  )
end