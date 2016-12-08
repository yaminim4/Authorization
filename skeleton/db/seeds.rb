# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create(username: "Yamini", password: "yaminipassword")
user2 = User.create(username: "Nate", password: "natepassword")
user3 = User.create(username: "Yong", password: "yongpassword")
user4 = User.create(username: "Andrew", password: "andrewpassword")
