# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ad = Address.new(city:  'Münster' , postal_code: '48167', street: 'Straße', house_number: '11', country: 'Germany' )
us = User.create(:email => "beer@beer.com", :password => 'Hallo123', :password_confirmation => 'Hallo123', :first_name => 'Peter', :last_name => 'Mueller', :address_id => ad.id)
cl = Club.create(name: "Test Club" , address_id: ad.id , user_id: us.id)
Event.create(title: "Test", sdate: Date.current, club_id: cl.id, imageURL: File.new("public/uploads/event/image.jpg"))
