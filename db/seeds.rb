# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!([{
  name: "Admin Acc",
  email: "admin@gmail.com",
  password: "admin",
  password_confirmation: "admin",
  role: '0',
  address: "Yangon",  
  dob: "1997-01-12",
  created_user_id: 1,
  updated_user_id: 1,
},
{
  name: "User Acc",
  email: "user@gmail.com",
  password: "user",
  password_confirmation: "user",
  role: '1',
  address: "Mandalay",
  dob: "2000-10-12",
  created_user_id: 1,
  updated_user_id: 1,
},
]) 