require 'database_cleaner'
require 'opencage/geocoder'
# This cleans after each rails db:seed (we need this on develop process)
DatabaseCleaner.clean_with(:truncation)

include SeedsHelper

100.times do
  lat = Faker::Number.normal(mean: 40.4, standard_deviation: 0.25)
  lng = Faker::Number.normal(mean: -3.7, standard_deviation: 0.25)

  Location.find_or_create_by(name: LocationSearcher.reverse_geocode(lat, lng).address) do |location|
    location.lat = lat
    location.lng = lng
    location.total_rooms = 0
  end
end

locations_ids = Location.ids

500.times do
  Room.create!(
    title: Faker::Quotes::Shakespeare.hamlet_quote,
    description: Faker::Lorem.paragraph,
    price: Faker::Number.number(digits: 3),
    owner: Faker::Games::Pokemon.name,
    location_id: locations_ids.sample
  )
end

# Temporally way to delete mock locations without room (not the most efficient)
Location.all.each do |location|
  db_rooms = RoomSearcher.search_rooms_by_location_id(location[:id])
    if db_rooms.present?
      location.total_rooms += 1
    else
      Location.where(id: location.id).destroy_all
    end
end

rooms_ids = Room.ids

2000.times do
  Photo.create!(
    room_id: rooms_ids.sample,
    url: "http://placehold.it/#{width}x#{height}",
  )
end
