User.create!(name:  "かちゃあ",
             email: "test@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

30.times do |n|
  name  = Faker::Name.name
  email = "test-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)

end