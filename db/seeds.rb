# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create(first_name:"Eddie" ,last_name:"Paulino" , email:"eddie.paulino5@gmail.com", password:"password", confirmed_at:DateTime.now) if Rails.env.development?

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
Industry.create(name:"") if Rails.env.development?

Discipline.create(name:"Architecture") if Rails.env.development?
Discipline.create(name:"Agricultural Engineering") if Rails.env.development?
Discipline.create(name:"Architectural Engineering") if Rails.env.development?
Discipline.create(name:"Biological Engineering") if Rails.env.development?
Discipline.create(name:"Chemical Engineering") if Rails.env.development?
Discipline.create(name:"Civil Engineering") if Rails.env.development?
Discipline.create(name:"Control Systems Engineering") if Rails.env.development?
Discipline.create(name:"Electrical and Computer Engineering") if Rails.env.development?
Discipline.create(name:"Environmental Engineering") if Rails.env.development?
Discipline.create(name:"Fire Protection Engineering") if Rails.env.development?
Discipline.create(name:"Industrial and Systems Engineering") if Rails.env.development?
Discipline.create(name:"Mechanical Engineering") if Rails.env.development?
Discipline.create(name:"Metallurgical and Materials Engineering") if Rails.env.development?
Discipline.create(name:"Mining and Mineral Processing Engineering") if Rails.env.development?
Discipline.create(name:"Naval Architecture and Marine Engineering") if Rails.env.development?
Discipline.create(name:"Nuclear Engineering") if Rails.env.development?
Discipline.create(name:"Petroleum Engineering") if Rails.env.development?
Discipline.create(name:"Software Engineering") if Rails.env.development?
Discipline.create(name:"Structural Engineering") if Rails.env.development?
Discipline.create(name:"Not Listed") if Rails.env.development?
Discipline.create(name:"") if Rails.env.development?