# Beer To Beer

##Heroku App

[![Beer-To-Beer](http://beertobeer.herokuapp.com/assets/img/ace/logo.png)](http://beertobeer.herokuapp.com)

## Getting Started

**run following commands**

**OS x**
```sh
brew install imagemagick
bundle install
rake db:migrate
rake db:seed
```

**Ubuntu**
```sh
sudo apt-get install imagemagick imagemagick-doc
bundle install
rake db:migrate
rake db:seed
```

##
##Testnutzer
**Admin**
 - admin@beer.com Passwort: Admin123
 
**User**
 - user@beer.com Passwort: User1234

##Userstorys

**User können…**
-	Sich registrieren und einloggen
-	Eigene Biere erstellen
-	Biere Bewerten
-	Sich durchschnittliche Bewertungen und Bewertungen anderer User ansehen
-	Shops erstellen und angeben welche Biere dort verkauft werden
-	Clubs erstellen
-	Events erstellen, die in ihren Clubs stattfinden
-	Angeben welche Biere in ihrem Club oder auf ihrem Event ausgeschenkt werden

**Admins können...**
- von Usern angelegt Clubs/Shops für die Website frei geben
- sämtliche Beiträge einsehen, editieren und löschen
