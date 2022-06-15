require 'faker'

User.destroy_all
Task.destroy_all

users = []

10.times do
  user = User.create!(email: Faker::Internet.email,
                      password: "1234567",
                      first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name)
  users << user
end

p 'Created users!'

50.times do
  task = Task.create!(title: Faker::Hobby.activity,
                      details: Faker::Hobby.activity,
                      priority: (1..5).to_a.sample,
                      user: users.sample)
end

p 'Created tasks!'
