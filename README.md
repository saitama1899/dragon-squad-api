<img src="https://image.freepik.com/free-vector/dragon-squad-mascot-esport-logo_139366-199.jpg" title="DragonSquad" alt="DragonSquad" width="400" height="400">


# DragonSquad API
> API REST project made for the challenge "a minimalistic Badi app"






[![Build Status](http://img.shields.io/travis/badges/badgerbadgerbadger.svg?style=flat-square)](https://travis-ci.org/badges/badgerbadgerbadger) [![Dependency Status](http://img.shields.io/gemnasium/badges/badgerbadgerbadger.svg?style=flat-square)](https://gemnasium.com/badges/badgerbadgerbadger) [![Coverage Status](http://img.shields.io/coveralls/badges/badgerbadgerbadger.svg?style=flat-square)](https://coveralls.io/r/badges/badgerbadgerbadger)[![Gem Version](http://img.shields.io/gem/v/badgerbadgerbadger.svg?style=flat-square)](https://rubygems.org/gems/badgerbadgerbadger) [![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org) [![Badges](http://img.shields.io/:badges-9/9-ff6799.svg?style=flat-square)](https://github.com/badges/badgerbadgerbadger)

Table of Contents 

- [API](#api) 🌐
- [Team](#team) 🧑‍🤝‍🧑
- [Features](#features) 🚀
- [License](#license) 📜


---

## API 🌐
### API
- **Ruby on Rails**
    - Ruby version 2.6.5p114 (2019-10-01 revision 67812) [x64-mingw32]
### DataBase
- **Postgres SQL**
    - Psql (PostgreSQL) 2.0

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
    - Return possible locations with the text you send as parameter with the keyword "location"
    - https://dragonsapi.herokuapp.com/api/v1/locations?location=mad
    - ⚠️ Requires Can't be blank, type String, min. three letters. 

- GET /rooms?lat=00.00&lng=-00.00&range=00
    - Show rooms by coordinates
    - https://dragonsapi.herokuapp.com/api/v1/rooms?lat=40.00000000000&lng=-3.000000000000&range=50000
     - ⚠️ Requires Can't be blank, type Float

---

## License 📜

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2020 © <a href="" target="_blank">DragonSquad</a>.
