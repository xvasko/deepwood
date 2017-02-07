User.create!(name:  "Matej Vasko",
             email: "matej.vasko@email.com",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example#{n+1}@deepwood.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# Microposts
users = User.order(:created_at).take(6)
2.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[1..10]
followers = users[5..10]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }