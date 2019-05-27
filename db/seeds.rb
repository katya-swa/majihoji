User.create!(name:  "Katya",
             email: "test@example.com",
             password:              "test",
             password_confirmation: "test",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "test-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)

  users = User.order(:created_at).take(6)
  20.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.items.create!(content: content) }
  end
end