require 'faker'

User.destroy_all
Task.destroy_all
Group.destroy_all

users = []
groups = []

100.times do
  user = User.create!(email: Faker::Internet.email,
                      password: '1234567',
                      first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name)
  5.times do
    group = Group.create!(name: Faker::Hobby.activity, user: user)
    groups << group
  end
  users << user
end

p 'Created users and groups!'

100.times do
  task = Task.new(title: Faker::Hobby.activity,
                  details: Faker::Hobby.activity,
                  priority: (1..5).to_a.sample,
                  user: users.sample)
  user_groups = groups.select do |group|
    task.user == group.user
  end
  task.group = user_groups.sample
  task.save!
end

p 'Created tasks!'
