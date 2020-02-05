<img src="https://image.freepik.com/free-vector/dragon-squad-mascot-esport-logo_139366-199.jpg" title="DragonSquad" alt="DragonSquad" width="200" height="200">


# DragonSquad API
> API REST project made for the challenge "a minimalistic Badi app"

[![Build Status](http://img.shields.io/travis/badges/badgerbadgerbadger.svg?style=flat-square)](https://travis-ci.org/badges/badgerbadgerbadger) [![Dependency Status](http://img.shields.io/gemnasium/badges/badgerbadgerbadger.svg?style=flat-square)](https://gemnasium.com/badges/badgerbadgerbadger) [![Coverage Status](http://img.shields.io/coveralls/badges/badgerbadgerbadger.svg?style=flat-square)](https://coveralls.io/r/badges/badgerbadgerbadger)[![Gem Version](http://img.shields.io/gem/v/badgerbadgerbadger.svg?style=flat-square)](https://rubygems.org/gems/badgerbadgerbadger) [![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org) [![Badges](http://img.shields.io/:badges-9/9-ff6799.svg?style=flat-square)](https://github.com/badges/badgerbadgerbadger)

Table of Contents

[API](#api)
[Team](#team)
[Features](#features)
[License](#license)


---

## API

- **Ruby on Rails**
    - Ruby version 2.6.5p114 (2019-10-01 revision 67812) [x64-mingw32]
### DataBase
- **Postgres SQL**
    - Psql (PostgreSQL) 2.0

---

## Team

> Most badass developers

| <a href="https://github.com/felixjimcal" target="_blank">**felixjimcal**</a> | <a href="https://github.com/saitama1899" target="_blank">**saitama1899**</a> | <a href="https://github.com/Vaniik" target="_blank">**Vaniik**</a> |
| :---: |:---:| :---:|
| [![https://github.com/felixjimcal](https://avatars2.githubusercontent.com/u/8387061?s=400&v=4)](https://github.com/felixjimcal)    | [![https://github.com/saitama1899](https://avatars0.githubusercontent.com/u/16955362?s=400&v=4)](https://github.com/saitama1899) | [![https://github.com/Vaniik](https://avatars3.githubusercontent.com/u/38564316?s=400&v=4)](https://github.com/Vaniik)  |
| <a href="https://github.com/felixjimcal" target="_blank">`https://github.com/felixjimcal`</a> | <a href="https://github.com/saitama1899" target="_blank">`https://github.com/saitama1899`</a> | <a href="https://github.com/Vaniik" target="_blank">`https://github.com/Vaniik`</a> |
---

## Features

### Some URI examples
Main https://dragonsapi.herokuapp.com/api/v1/

- GET /locations?location=mad
    - Return possible locations with the text you sent as parameter with the keyword "location"
    - https://dragonsapi.herokuapp.com/api/v1/locations?location=mad
    - Requires Can't be blank, type String, min. three letters.
    - It can be used as an auto-fill
    - Only search locations in our database

- GET /rooms?lat=00.00&lng=-00.00&range=00
    - Return a list of rooms inside a boundary box created from coordinates and range given on the URL
    - https://dragonsapi.herokuapp.com/api/v1/rooms?lat=40.00000000000&lng=-3.000000000000&range=50000
    - Requires Can't be blank, type Float
    - Optional params to sort by: price, max price, popularity
    - https://dragonsapi.herokuapp.com/api/v1/rooms?lat=40.00000000000&lng=-3.000000000000&range=50000&max_price=600&order_by_price=1

- GET /rooms/:id
    - Return all data from a specific room
    - https://dragonsapi.herokuapp.com/api/v1/rooms/39

---

## Internally
We separated all the logic from endpoints into services.

### Main services
- LocationSearcher
    ```ruby
      def self.find_place(location)
        # Predictable location search logic, returns the first 5 results
      end

      def self.reverse_geocode(lat, lng)
        # Returns the adress name of the bounds
      end
    ```
- RoomSearcher
    ```ruby
      def self.search_rooms_by_coordinates(lat, lng, range = 1000)
        # Find all the rooms nerby the bounds using a range
      end

      def self.sort_results(rooms, params)
        # Sort that rooms list with diferent optional params
      end

      def pagination(rooms, params)
        # Pagination logic to load a few rooms per page
      end
    ```

### Cron jobs
- Room on fire feature
    - Restart every hour the status "on fire" of a room
    - This enum status indicates if the Room was visited last hour or not
    ```ruby
      # Clears Rooms on fire (visited on last hour)
      scheduler.cron '0 * * * *' do
        Room.onfire.each do |room|
          room.irrelevant!
        end
      end
    ```
- Motivational sentences for the developer
    - We tested the cron function with some puts to the server, so we decided to make a simple ['Motivational sentences' Gem](https://github.com/saitama1899/be_a_dragon) to use with it to help us on development process.
    ```ruby
    require 'be_a_dragon'

    scheduler = Rufus::Scheduler.new
    motivation = BeADragon::MotivateMePls

    scheduler.cron '30 * * * *' do
      motivation.random_sentence('Eric')
    end
    ```
    <img src="https://i.gyazo.com/f89ee52abf4e3995dd26fd1ab90cd98e.png" title="DragonSquad" alt="DragonSquad" height="85" width="350">

### Model relations
  - Location (has many rooms)
  - Room (belongs to location, has many photos, has many room_stats)
  - Photo (belongs to room)
  - RoomStat (belongs to room)
  - User
  
### Backend logic schema


### Quick JQuery Frontend
[Quick JQuery Frontend (on development 05/02/20)](https://blaugranas.es/budi.html)

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2020 © <a href="" target="_blank">DragonSquad</a>.
