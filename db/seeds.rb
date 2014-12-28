#encoding: utf-8
ad = Address.create(city:  'Münster' , postal_code: '48167', street: 'Straße', house_number: '11', country: 'Germany' )
us = User.create(:email => "beer@beer.com", :password => 'Hallo123', :password_confirmation => 'Hallo123', :first_name => 'Peter', :last_name => 'Mueller', :address_id => ad.id)
cl = Club.create(name: "Test Club" , address_id: ad.id , user_id: us.id)
Event.create(title: "Test", sdate: Date.current, club_id: cl.id, imageURL: File.new("public/uploads/event/image.jpg", :encoding => "UTF-8"))