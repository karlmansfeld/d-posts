User.create!(name:  "Example User",
             email: "example@sample.com",
             password:              "foobar",
             password_confirmation: "foobar")

69.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@sample.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
