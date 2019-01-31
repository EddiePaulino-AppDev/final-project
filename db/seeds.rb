# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Industry.create(name:"Government/Regulator") if Rails.env.development?
Industry.create(name:"Water/Wastewater") if Rails.env.development?
Industry.create(name:"Transportation") if Rails.env.development?
Industry.create(name:"High-rise/Residential/Commercial") if Rails.env.development?
Industry.create(name:"Manufacturing") if Rails.env.development?
Industry.create(name:"Aviation and Aerospace") if Rails.env.development?
Industry.create(name:"Telecommunication") if Rails.env.development?
Industry.create(name:"Energy") if Rails.env.development?
Industry.create(name:"Agriculture") if Rails.env.development?
Industry.create(name:"Construction") if Rails.env.development?
Industry.create(name:"Not Listed") if Rails.env.development?