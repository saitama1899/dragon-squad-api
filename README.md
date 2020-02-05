<p align="center">
<img src="https://image.freepik.com/free-vector/dragon-squad-mascot-esport-logo_139366-199.jpg" title="DragonSquad" alt="DragonSquad" width="200" height="200">
</p>

# DragonSquad API

[![Build Status](http://img.shields.io/travis/badges/badgerbadgerbadger.svg?style=flat-square)](https://travis-ci.org/badges/badgerbadgerbadger) [![Dependency Status](http://img.shields.io/gemnasium/badges/badgerbadgerbadger.svg?style=flat-square)](https://gemnasium.com/badges/badgerbadgerbadger) [![Coverage Status](http://img.shields.io/coveralls/badges/badgerbadgerbadger.svg?style=flat-square)](https://coveralls.io/r/badges/badgerbadgerbadger)[![Gem Version](http://img.shields.io/gem/v/badgerbadgerbadger.svg?style=flat-square)](https://rubygems.org/gems/badgerbadgerbadger) [![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org) [![Badges](http://img.shields.io/:badges-9/9-ff6799.svg?style=flat-square)](https://github.com/badges/badgerbadgerbadger)



### Table of Contents

- [Introduction](#introduction)
- [API](#api)
- [Team](#team)
- [Features](#features)
- [License](#license)


---

## Introduction

Welcome!

Here you will find our contribution to the "minimalsitic Badi app" challenge. We have used the, we believe, same tools as badi, we have even added our own gem. We have a deep explanation in our wiki.


---

## API 🌐

- **Ruby on Rails**
    - Ruby version 2.6.5p114 (2019-10-01 revision 67812) [x64-mingw32]
### DataBase
- **Postgres SQL**
    - Psql (PostgreSQL) 2.0
    
### Quick JQuery Frontend
  [Quick JQuery Frontend (on development 05/02/20)](https://blaugranas.es/budi.html)
  
  ---
## Team 🧑‍🤝‍🧑

> Most badass developers

| <a href="https://github.com/felixjimcal" target="_blank">**felixjimcal**</a> | <a href="https://github.com/saitama1899" target="_blank">**saitama1899**</a> | <a href="https://github.com/Vaniik" target="_blank">**Vaniik**</a> |
| :---: |:---:| :---:|
| [![https://github.com/felixjimcal](https://avatars2.githubusercontent.com/u/8387061?s=400&v=4)](https://github.com/felixjimcal)    | [![https://github.com/saitama1899](https://avatars0.githubusercontent.com/u/16955362?s=400&v=4)](https://github.com/saitama1899) | [![https://github.com/Vaniik](https://avatars3.githubusercontent.com/u/38564316?s=400&v=4)](https://github.com/Vaniik)  |
| <a href="https://github.com/felixjimcal" target="_blank">`https://github.com/felixjimcal`</a> | <a href="https://github.com/saitama1899" target="_blank">`https://github.com/saitama1899`</a> | <a href="https://github.com/Vaniik" target="_blank">`https://github.com/Vaniik`</a> |
---

## Features 🚀

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
    - https://dragonsapi.herokuapp.com/api/v1/rooms?lat=40.64521937583381&lng=-3.4745317454325817&range=5000
    - Requires Can't be blank, type Float
    - Optional params to sort by: price, max price, popularity
    - https://dragonsapi.herokuapp.com/api/v1/rooms?lat=40.64521937583381&lng=-3.4745317454325817&range=5000&max_price=400&order_by_price=1

- GET /rooms/:id
    - Return all data from a specific room
    - https://dragonsapi.herokuapp.com/api/v1/rooms/39

---

### Full Documentation on WIKI

#### [GitHub Flow](https://github.com/Vaniik/dragon-squad-api/wiki/GitHub-Flow)
#### [Grape and TDD](https://github.com/Vaniik/dragon-squad-api/wiki/API-with-Grape)
#### [Backend logic schema](https://github.com/Vaniik/dragon-squad-api/wiki/Backend-logic-schema)
#### [Main services](https://github.com/Vaniik/dragon-squad-api/wiki/Main-services)
#### [BD and mock data](https://github.com/Vaniik/dragon-squad-api/wiki/BD-and-mock-data)
#### [Endpoints](https://github.com/Vaniik/dragon-squad-api/wiki/Endpoints)
#### [Cron jobs](https://github.com/Vaniik/dragon-squad-api/wiki/Cron-jobs)
#### [Error handling](https://github.com/Vaniik/dragon-squad-api/wiki/Error-handling)
#### [Pagination](https://github.com/Vaniik/dragon-squad-api/wiki/Pagination)
#### [Deploy to Heroku](https://github.com/Vaniik/dragon-squad-api/wiki/Deploy-on-Heroku)


### [Trello project](https://trello.com/b/GICUoEJs/badiproject)

## License 📜

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2020 © <a href="" target="_blank">DragonSquad</a>.
