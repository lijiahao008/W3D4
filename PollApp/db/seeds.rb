# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
user_1 = User.create!(:user_name => Faker::Name.name)
user_2 = User.create!(:user_name => Faker::Name.name)
user_3 = User.create!(:user_name => Faker::Name.name)
user_4 = User.create!(:user_name => Faker::Name.name)
user_5 = User.create!(:user_name => Faker::Name.name)
user_6 = User.create!(:user_name => Faker::Name.name)
user_7 = User.create!(:user_name => Faker::Name.name)
user_8 = User.create!(:user_name => Faker::Name.name)
user_9 = User.create!(:user_name => Faker::Name.name)
user_arr = [user_1,user_2,user_3,user_4,user_5,user_6,user_7,user_8,user_9]

Poll.destroy_all
poll_1 = Poll.create!(:title => Faker::Superhero.name, :author_id => user_1.id)
poll_2 = Poll.create!(:title => Faker::Superhero.name, :author_id => user_1.id)
poll_3 = Poll.create!(:title => Faker::Superhero.name, :author_id => user_1.id)
poll_4 = Poll.create!(:title => Faker::Superhero.name, :author_id => user_4.id)
poll_5 = Poll.create!(:title => Faker::Superhero.name, :author_id => user_4.id)

poll_arr = [poll_1,poll_2,poll_3,poll_4,poll_5]
Question.destroy_all
questions_arr = []
poll_arr.each do |poll|
  4.times do
    questions_arr << Question.create!(:body => Faker::Hipster.sentence, :poll_id => poll.id)
  end
end

AnswerChoice.destroy_all
answer_arr = []
questions_arr.each do |question|
  4.times do
    answer_arr << AnswerChoice.create!(:body => Faker::Pokemon.name, :question_id => question.id)
  end
end

Response.destroy_all
user_arr.each do |user|
  Response.create!(:user_id => user.id, :answer_choice_id => answer_arr.sample.id)
end
