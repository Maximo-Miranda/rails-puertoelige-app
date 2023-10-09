# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

50.times do
  User.create(name: Faker::FunnyName.name,
              lastname: Faker::FunnyName.name,
              identification: Faker::Code.nric,
              email: Faker::Internet.email,
              password: "secret",
              password_confirmation: "secret",
              confirmed_at: Time.now,
  )
end

500.times do
  question_id = Question.pluck(:id).sample
  answer_id = Answer.pluck(:id).sample
  user_id = User.pluck(:id).sample

  ResponseQuestion.where(question_id: question_id, answer_id: answer_id, user_id: user_id).exists? ?
    next : ResponseQuestion.create(question_id: question_id, answer_id: answer_id, user_id: user_id)
end

one_fake_question = Question.create(title: Faker::Lorem.sentence(word_count: 3), body: "¿ #{Faker::Lorem.sentence(word_count: 5)} ?", answer_type: :unique_choice, status: :active, start_at: Time.now + 1.day, end_at: Time.now + 2.day, user_id: 1)
two_fake_question = Question.create(title: Faker::Lorem.sentence(word_count: 3), body: "¿ #{Faker::Lorem.sentence(word_count: 5)} ?", answer_type: :unique_choice, status: :active, start_at: Time.now + 1.day, end_at: Time.now + 2.day, user_id: 1)
three_fake_question = Question.create(title: Faker::Lorem.sentence(word_count: 3), body: "¿ #{Faker::Lorem.sentence(word_count: 5)} ?", answer_type: :unique_choice, status: :active, start_at: Time.now + 1.day, end_at: Time.now + 2.day, user_id: 1)

50.times do
  Answer.create(title: Faker::Lorem.sentence(word_count: 3), body: Faker::Lorem.sentence(word_count: 5), answer_type: :unique_choice, status: :active, question_id: one_fake_question.id)
end

101.times do
  Answer.create(title: Faker::Lorem.sentence(word_count: 3), body: Faker::Lorem.sentence(word_count: 5), answer_type: :unique_choice, status: :active, question_id: two_fake_question.id)
end

9.times do
  Answer.create(title: Faker::Lorem.sentence(word_count: 3), body: Faker::Lorem.sentence(word_count: 5), answer_type: :unique_choice, status: :active, question_id: three_fake_question.id)
end