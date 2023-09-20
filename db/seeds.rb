# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Profile.destroy_all


# Create 20 profiles
20.times do
    Profile.create(
        name: Faker::Lorem.sentence(word_count: 3),
        cpf: Faker::Number.unique.number(digits: 11).to_s,
        phone: Faker::PhoneNumber.phone_number,
        city: Faker::Address.city,
        email: Faker::Internet.email   
    )
  end