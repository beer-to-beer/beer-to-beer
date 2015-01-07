#encoding: utf-8
ad = Address.create(city:  'Münster' , postal_code: '48167', street: 'Straße', house_number: '11', country: 'Germany' )
admin = User.create(:email => "admin@beer.com", :password => 'Admin123', :password_confirmation => 'Admin123', :first_name => 'Admin', :last_name => 'Admin', :address_id => ad.id)
admin.add_role :admin
jan = User.create(:email => "jan@beer.com", :password => 'Jan12345', :password_confirmation => 'Jan12345', :first_name => 'Jan', :last_name => 'Wendt', :address_id => ad.id)
jan.add_role :admin
jan.add_role :user

thorsten = User.create(:email => "thorsten@beer.com", :password => 'Thorsten123', :password_confirmation => 'Thorsten123', :first_name => 'Thorsten', :last_name => 'Woywod', :address_id => ad.id)
thorsten.add_role :admin
user = User.create(:email => "user@beer.com", :password => 'User1234', :password_confirmation => 'User1234', :first_name => 'Thorsten', :last_name => 'Woywod', :address_id => ad.id)
user.add_role :user

us = User.create(:email => "beer@beer.com", :password => 'Hallo123', :password_confirmation => 'Hallo123', :first_name => 'Peter', :last_name => 'Mueller', :address_id => ad.id)
cl1 = Club.create(name: "Test Club" , address_id: ad.id , user_id: user.id, active: false)
cl = Club.create(name: "Test Club 2" , address_id: ad.id , user_id: us.id, active: true)
Event.create(title: "Test1", sdate: Date.current, club_id: cl1.id, imageURL: File.new("public/uploads/event/image.jpg", :encoding => "UTF-8"))
Event.create(title: "Test2", sdate: Date.current, club_id: cl1.id, imageURL: File.new("public/uploads/event/image.jpg", :encoding => "UTF-8"))
Event.create(title: "Test3", sdate: Date.current, club_id: cl.id, imageURL: File.new("public/uploads/event/image.jpg", :encoding => "UTF-8"))
Event.create(title: "Test4", sdate: Date.current, club_id: cl.id, imageURL: File.new("public/uploads/event/image.jpg", :encoding => "UTF-8"))
ca = Category.create(name: "Weizen")
ca1 = Category.create(name: "Pils")
pr = Producer.create(name: "Krombacher", address_id: ad.id)
pr1 = Producer.create(name: "Veltins", address_id: ad.id)
Beer.create(title: "Krombacher Weizen", category_id: ca.id, producer_id: pr.id)
Beer.create(title: "Krombacher", category_id: ca1.id, producer_id: pr.id)
Beer.create(title: "Veltins", category_id: ca1.id, producer_id: pr1.id)
