# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now,
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  exercise1 = Faker::Lorem.sentence(5)
  exercise2 = Faker::Lorem.sentence(5)
  exercise3 = Faker::Lorem.sentence(5)
  exercise4 = Faker::Lorem.sentence(5)
  exercise5 = Faker::Lorem.sentence(5)
  exercise6 = Faker::Lorem.sentence(5)
  tag = Faker::Lorem.sentence(5)
  day = Faker::Time.between(DateTime.now - 1, DateTime.now)
  users.each { |user| user.workouts.create!(exercise1: exercise1,
                                              exercise2: exercise2,
                                              exercise3: exercise3,
                                              exercise4: exercise4,
                                              exercise5: exercise5,
                                              exercise6: exercise6,
                                              tag: tag,
                                              day: day) }
end



# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
