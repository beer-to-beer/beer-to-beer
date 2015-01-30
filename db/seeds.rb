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
Event.create!(title: "Test1", sdate: Date.current, club_id: cl1.id, imageURL: File.new("ace/app/assets/img/ace/uploads/events/image1.jpg", :encoding => "UTF-8"))
Event.create!(title: "Test2", sdate: Date.current, club_id: cl1.id, imageURL: File.new("ace/app/assets/img/ace/uploads/events/image2.jpg", :encoding => "UTF-8"))
Event.create!(title: "Test3", sdate: Date.current, club_id: cl.id, imageURL: File.new("ace/app/assets/img/ace/uploads/events/image3.jpg", :encoding => "UTF-8"))
Event.create!(title: "Test4", sdate: Date.current, club_id: cl.id, imageURL: File.new("ace/app/assets/img/ace/uploads/events/image4.jpg", :encoding => "UTF-8"))
ca = Category.create(name: "Weizen")
ca1 = Category.create(name: "Pils")
pr = Producer.create(name: "Krombacher", address_id: ad.id)
pr1 = Producer.create(name: "Veltins", address_id: ad.id)
b1 = Beer.create(title: "Krombacher Weizen", category_id: ca.id, producer_id: pr.id)
b2 = Beer.create(title: "Krombacher", category_id: ca1.id, producer_id: pr.id)
b3 = Beer.create(title: "Veltins", category_id: ca1.id, producer_id: pr1.id)

sh = Shop.create(name: "Test Shop", address_id: ad.id)

r1 = Rating.create(beer_id: b1.id, user_id:jan.id, headline:"Ganz okay", comment:"gut gut gut" )
r2 = Rating.create(beer_id: b2.id, user_id:jan.id, headline:"Sehr gut",comment:"gut. dieser text muss lang werden" )
r3 = Rating.create(beer_id: b3.id, user_id:jan.id, headline:"Ganz okay",comment:"gut gut gut" )
r4 = Rating.create(beer_id: b1.id, user_id:thorsten.id,headline:"Ganz okay", comment:"gut gut gut" )
r5 = Rating.create(beer_id: b2.id, user_id:thorsten.id, headline:"Völlig okay und dies und das",comment:"gut. dieser text muss lang werden" )
r6 = Rating.create(beer_id: b3.id, user_id:thorsten.id,headline:"Ganz gut", comment:"gut gut gut" )
Criterion.create(rating_id: r1.id, name: "Price",value: "2")
Criterion.create(rating_id: r1.id, name: "Taste",value: "3")
Criterion.create(rating_id: r1.id, name: "Headache",value: "3")
Criterion.create(rating_id: r2.id, name: "Price",value: "4")
Criterion.create(rating_id: r2.id, name: "Taste",value: "3")
Criterion.create(rating_id: r2.id, name: "Headache",value: "3")
Criterion.create(rating_id: r3.id, name: "Price",value: "4")
Criterion.create(rating_id: r3.id, name: "Taste",value: "3")
Criterion.create(rating_id: r3.id, name: "Headache",value: "4")
Criterion.create(rating_id: r4.id, name: "Price",value: "4")
Criterion.create(rating_id: r4.id, name: "Taste",value: "3")
Criterion.create(rating_id: r4.id, name: "Headache",value: "4")
Criterion.create(rating_id: r5.id, name: "Price",value: "5")
Criterion.create(rating_id: r5.id, name: "Taste",value: "3")
Criterion.create(rating_id: r5.id, name: "Headache",value: "1")
Criterion.create(rating_id: r6.id, name: "Price",value: "2")
Criterion.create(rating_id: r6.id, name: "Taste",value: "1")
Criterion.create(rating_id: r6.id, name: "Headache",value: "2")