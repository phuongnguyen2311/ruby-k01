# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.create!(name: "Example User", email: "giap-#(n+1)@gmail.com", password: "Thien1994@",
password_confirmation: "Thien1994@", gender: "male", admin: true, activated: true, activated_at: Time.zone.now)
99.times do |n|
  name = Faker::Name.name,
  email ="giap-#(n+1)@gmail.com",
  password = "Thien1994@",
  gender = "male"
  User.create!(name: name, email: email, password: password,
               password_confirmation: password,gender: gender,
                activated: true, activated_at: Time.zone.now)
end
