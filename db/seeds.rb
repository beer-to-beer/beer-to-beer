#encoding: utf-8
ad = Address.create(city:  'Münster' , postal_code: '48149', street: 'Corrensstraße', house_number: '25', country: 'Germany' )

admin = User.create(:email => "admin@beer.com", :password => 'Admin123', :password_confirmation => 'Admin123', :first_name => 'Admin', :last_name => 'Admin', :address_id => ad.id)
admin.add_role :admin

user = User.create(:email => "user@beer.com", :password => 'User1234', :password_confirmation => 'User1234', :first_name => 'Thorsten', :last_name => 'Woywod', :address_id => ad.id)
user.add_role :user

jan = User.create(:email => "jan@beer.com", :password => 'Jan12345', :password_confirmation => 'Jan12345', :first_name => 'Jan', :last_name => 'Wendt', :address_id => ad.id)
jan.add_role :admin

thorsten = User.create(:email => "thorsten@beer.com", :password => 'Thorsten123', :password_confirmation => 'Thorsten123', :first_name => 'Thorsten', :last_name => 'Woywod', :address_id => ad.id)
thorsten.add_role :admin

marcel = User.create(:email => "marcel@beer.com", :password => 'Marcel123', :password_confirmation => 'Marcel123', :first_name => 'Marcel', :last_name => 'Voß', :address_id => ad.id)
marcel.add_role :user

christopher = User.create(:email => "christopher@beer.com", :password => 'Chris123', :password_confirmation => 'Chris123', :first_name => 'Christopher', :last_name => 'Andres', :address_id => ad.id)
christopher.add_role :user



ca = Category.create(name: "Weizen")
ca1 = Category.create(name: "Pils")

pr = Producer.create(name: "Krombacher", address_id: ad.id)
pr1 = Producer.create(name: "Veltins", address_id: ad.id)
pr2 = Producer.create(name: "Heineken", address_id: ad.id)
pr3 = Producer.create(name: "Erdinger Weißbräu", address_id: ad.id)

b1 = Beer.create(title: "Krombacher Weizen", category_id: ca.id, producer_id: pr.id, beerURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/beer/Krombacher_Flasche_Weizen.jpg", :encoding => "UTF-8"))
b2 = Beer.create(title: "Krombacher", category_id: ca1.id, producer_id: pr.id, beerURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/beer/Krombacher_Flasche_Pils.jpg", :encoding => "UTF-8"))
b3 = Beer.create(title: "Veltins", category_id: ca1.id, producer_id: pr1.id, beerURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/beer/Veltins_Flasche.jpg", :encoding => "UTF-8"))
b4 = Beer.create(title: "Erdinger", category_id: ca.id, producer_id: pr3.id, beerURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/beer/Erdinger.jpg", :encoding => "UTF-8"))
b5 = Beer.create(title: "Heineken", category_id: ca1.id, producer_id: pr2.id, beerURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/beer/Heineken.jpg", :encoding => "UTF-8"))


cl = Club.create(name: "Beer Club" , address_id: ad.id , user_id: user.id, active: false, beer_ids:[b1.id, b2.id,b3.id], clubURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/club/club1.jpg", :encoding => "UTF-8") )
cl1 = Club.create(name: "Club of Beer" , address_id: ad.id , user_id: thorsten.id, active: true, beer_ids:[b2.id, b3.id,b4.id], clubURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/club/club2.jpg", :encoding => "UTF-8"))
cl2 = Club.create(name: "The Club" , address_id: ad.id , user_id: christopher.id, active: true, beer_ids:[b3.id, b4.id,b5.id], clubURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/club/club3.jpg", :encoding => "UTF-8"))

Event.create(title: "Event 1", sdate: Faker::Time.forward(23, :morning).change(year: 2016), club_id: cl.id, imageURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/event/image1.jpg", :encoding => "UTF-8"))
Event.create(title: "Event 2", sdate: Faker::Time.forward(23, :morning).change(year: 2016), club_id: cl.id, imageURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/event/image2.jpg", :encoding => "UTF-8"))
Event.create(title: "Event 3", sdate: Faker::Time.forward(23, :morning).change(year: 2016), club_id: cl1.id, imageURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/event/image3.jpg", :encoding => "UTF-8"))
Event.create(title: "Event 4", sdate: Faker::Time.forward(23, :morning).change(year: 2016), club_id: cl1.id, imageURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/event/image4.jpg", :encoding => "UTF-8"))
Event.create(title: "Event 5", sdate: Faker::Time.forward(23, :morning).change(year: 2016), club_id: cl2.id, imageURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/event/image3.jpg", :encoding => "UTF-8"))
Event.create(title: "Event 6", sdate: Faker::Time.forward(23, :morning).change(year: 2016), club_id: cl2.id, imageURL: File.new("#{Rails.root}/ace/app/assets/img/ace/uploads/event/image4.jpg", :encoding => "UTF-8"))

sh = Shop.create(name: "XXL Beerhouse", address_id: ad.id, website: "www.xxlbeerhouse.de", phonenumber: "123456789", email: "info@xxlbeerhouse.de", active: false ,beer_ids:[b1.id, b2.id,b3.id] )
sh1 = Shop.create(name: "House of Beer", address_id: ad.id, website: "www.houseofbeer.de", phonenumber: "123456789", email: "info@houseofbeer.de", active: true, beer_ids:[b3.id, b4.id,b5.id] )


r1 = Rating.create(beer_id: b1.id, user_id:jan.id, headline:"Ganz okay", comment:"consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt" )
r2 = Rating.create(beer_id: b2.id, user_id:jan.id, headline:"Sehr gut",comment:"At vero eos et accusam et justo duo dolores et ea rebum" )
r3 = Rating.create(beer_id: b3.id, user_id:jan.id, headline:"Ganz okay",comment:"Lorem ipsum dolor sit amet, consetetur sadipscing elitr" )

r4 = Rating.create(beer_id: b2.id, user_id:thorsten.id,headline:"Ganz okay", comment:"At vero eos et accusam et justo duo dolores et ea rebum" )
r5 = Rating.create(beer_id: b3.id, user_id:thorsten.id, headline:"Völlig okay und dies und das",comment:"consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt" )
r6 = Rating.create(beer_id: b4.id, user_id:thorsten.id,headline:"Ganz gut", comment:"Lorem ipsum dolor sit amet, consetetur sadipscing elitr" )

r7 = Rating.create(beer_id: b3.id, user_id:marcel.id,headline:"Ganz okay", comment:"Lorem ipsum dolor sit amet, consetetur sadipscing elitr" )
r8 = Rating.create(beer_id: b4.id, user_id:marcel.id, headline:"Völlig okay und dies und das",comment:"Lorem ipsum dolor sit amet, consetetur sadipscing elitr" )
r9 = Rating.create(beer_id: b5.id, user_id:marcel.id,headline:"Ganz gut", comment:"Lorem ipsum dolor sit amet, consetetur sadipscing elitr" )

r10 = Rating.create(beer_id: b1.id, user_id:christopher.id,headline:"Ganz okay", comment:"Lorem ipsum dolor sit amet, consetetur sadipscing elitr" )
r11 = Rating.create(beer_id: b2.id, user_id:christopher.id, headline:"Völlig okay und dies und das",comment:"Lorem ipsum dolor sit amet, consetetur sadipscing elitr" )
r12 = Rating.create(beer_id: b3.id, user_id:christopher.id,headline:"Ganz gut", comment:"Lorem ipsum dolor sit amet, consetetur sadipscing elitr" )

Criterion.create(rating_id: r1.id, name: "Price",value: "5")
Criterion.create(rating_id: r1.id, name: "Taste",value: "3")
Criterion.create(rating_id: r1.id, name: "Headache",value: "3")
Criterion.create(rating_id: r2.id, name: "Price",value: "4")
Criterion.create(rating_id: r2.id, name: "Taste",value: "3")
Criterion.create(rating_id: r2.id, name: "Headache",value: "3")
Criterion.create(rating_id: r3.id, name: "Price",value: "5")
Criterion.create(rating_id: r3.id, name: "Taste",value: "3")
Criterion.create(rating_id: r3.id, name: "Headache",value: "4")
Criterion.create(rating_id: r4.id, name: "Price",value: "4")
Criterion.create(rating_id: r4.id, name: "Taste",value: "5")
Criterion.create(rating_id: r4.id, name: "Headache",value: "4")
Criterion.create(rating_id: r5.id, name: "Price",value: "5")
Criterion.create(rating_id: r5.id, name: "Taste",value: "3")
Criterion.create(rating_id: r5.id, name: "Headache",value: "1")
Criterion.create(rating_id: r6.id, name: "Price",value: "2")
Criterion.create(rating_id: r6.id, name: "Taste",value: "1")
Criterion.create(rating_id: r6.id, name: "Headache",value: "2")

Criterion.create(rating_id: r7.id, name: "Price",value: "2")
Criterion.create(rating_id: r7.id, name: "Taste",value: "3")
Criterion.create(rating_id: r7.id, name: "Headache",value: "3")
Criterion.create(rating_id: r8.id, name: "Price",value: "4")
Criterion.create(rating_id: r8.id, name: "Taste",value: "5")
Criterion.create(rating_id: r8.id, name: "Headache",value: "3")
Criterion.create(rating_id: r9.id, name: "Price",value: "4")
Criterion.create(rating_id: r9.id, name: "Taste",value: "3")
Criterion.create(rating_id: r9.id, name: "Headache",value: "4")
Criterion.create(rating_id: r10.id, name: "Price",value: "1")
Criterion.create(rating_id: r10.id, name: "Taste",value: "3")
Criterion.create(rating_id: r10.id, name: "Headache",value: "4")
Criterion.create(rating_id: r11.id, name: "Price",value: "5")
Criterion.create(rating_id: r11.id, name: "Taste",value: "3")
Criterion.create(rating_id: r11.id, name: "Headache",value: "1")
Criterion.create(rating_id: r12.id, name: "Price",value: "2")
Criterion.create(rating_id: r12.id, name: "Taste",value: "1")
Criterion.create(rating_id: r12.id, name: "Headache",value: "2")