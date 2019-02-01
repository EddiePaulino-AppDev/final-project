# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create(first_name:"Eddie" ,last_name:"Paulino" , email:"eddie.paulino5@gmail.com", password:"password", confirmed_at:DateTime.now) 

Industry.create(name:"Government/Regulator")  
Industry.create(name:"Water/Wastewater")  
Industry.create(name:"Transportation")  
Industry.create(name:"High-rise/Residential/Commercial")  
Industry.create(name:"Manufacturing")  
Industry.create(name:"Aviation and Aerospace")  
Industry.create(name:"Telecommunication")  
Industry.create(name:"Energy")  
Industry.create(name:"Agriculture")  
Industry.create(name:"Construction")  
Industry.create(name:"Not Listed")  
Industry.create(name:"")  

Discipline.create(name:"Architecture")  
Discipline.create(name:"Agricultural Engineering")  
Discipline.create(name:"Architectural Engineering")  
Discipline.create(name:"Biological Engineering")  
Discipline.create(name:"Chemical Engineering")  
Discipline.create(name:"Civil Engineering")  
Discipline.create(name:"Control Systems Engineering")  
Discipline.create(name:"Electrical and Computer Engineering")  
Discipline.create(name:"Environmental Engineering")  
Discipline.create(name:"Fire Protection Engineering")  
Discipline.create(name:"Industrial and Systems Engineering")  
Discipline.create(name:"Mechanical Engineering")  
Discipline.create(name:"Metallurgical and Materials Engineering")  
Discipline.create(name:"Mining and Mineral Processing Engineering")  
Discipline.create(name:"Naval Architecture and Marine Engineering")  
Discipline.create(name:"Nuclear Engineering")  
Discipline.create(name:"Petroleum Engineering")  
Discipline.create(name:"Software Engineering")  
Discipline.create(name:"Structural Engineering")  
Discipline.create(name:"Not Listed")  
Discipline.create(name:"")  