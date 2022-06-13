# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# d1 = DateTime.new(2015, 6, 22)
# start_on: d1,
# dob: DateTime.parse("2022-06-02"),
# some_date = 4.days.ago
# dob: some_date,
# "dob"=>"2022-06-02"


User.create!([{
  name: "Admin Acc",
  email: "htaylail.fortest@gmail.com",
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