# README

# ENDPOINTS

* GET     |/health ---> Return the health of the service
* GET     |/api/v1/admin/rooms ---> Return a list with all the rooms on the database with all his data
* GET     |/api/v1/admin/rooms/:id ---> Return a room on the database with all his data
* GET     |/api/v1/rooms?lat=(latitude) &lng=(longitude)& range=(searching range) ---> return a room list within a rectangle on the desired location  (actually disabled)
* GET     |/api/v1/rooms/:id --->return a specific room
* GET     | /api/v1/locations
* GET     | /api/:version/admin/users ---> get all user
* GET     |  /api/:version/admin/users/:id ---> get a specific user
* POST    |  /api/:version/admin/users ---> create new user
* PUT     |  /api/:version/admin/users/:id ---> update an user
* DELETE  |  /api/:version/admin/users/:id ---> delete an user
<!-->
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
