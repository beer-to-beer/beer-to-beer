#encoding: utf-8
ad = Address.create(city:  'Münster' , postal_code: '48167', street: 'Straße', house_number: '11', country: 'Germany' )
us = User.create(:email => "beer@beer.com", :password => 'Hallo123', :password_confirmation => 'Hallo123', :first_name => 'Peter', :last_name => 'Mueller', :address_id => ad.id)
cl = Club.create(name: "Test Club" , address_id: ad.id , user_id: us.id)
Event.create(title: "Test", sdate: Date.current, club_id: cl.id, imageURL: File.new("public/uploads/event/image.jpg", :encoding => "UTF-8"))
Beer.create(title: "Krombacher")
Beer.create(title: "Veltins")
admin = User.create(:email => "admin@beer.com", :password => 'Admin123', :password_confirmation => 'Admin123', :first_name => 'Admin', :last_name => 'Admin', :address_id => ad.id)
admin.add_role :admin
jan = User.create(:email => "jan@beer.com", :password => 'Jan123', :password_confirmation => 'Jan123', :first_name => 'Jan', :last_name => 'Wendt', :address_id => ad.id)
jan.add_role :admin
thorsten = User.create(:email => "thorsten@beer.com", :password => 'Thorsten123', :password_confirmation => 'Thorsten123', :first_name => 'Thorsten', :last_name => 'Woywod', :address_id => ad.id)
thorsten.add_role :admin