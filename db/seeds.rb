# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.new(email: "beer@beer.com", password: 'Hallo123', password_confirmation: 'Hallo123', first_name: 'Peter', last_name: 'Mueller')
Club.create(name: "Test Club")
Event.create(title: "Test", sdate: Date.current, club_id: Club.first.id, imageURL: File.new("public/uploads/event/image.jpg"))