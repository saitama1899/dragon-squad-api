require 'database_cleaner'
# This cleans after each rails db:seed
DatabaseCleaner.clean_with(:truncation)

include SeedsHelper

500.times do
  Room.create!(
    title: Faker::Quotes::Shakespeare.hamlet_quote,
    description: Faker::Lorem.paragraph,
    price: Faker::Number.number(digits: 3),
    owner: Faker::Games::Pokemon.name,
    lat: Faker::Number.normal(mean: 41, standard_deviation: 0.25),
    lng: Faker::Number.normal(mean: 2, standard_deviation: 0.25)
  )
end

rooms_ids = Room.ids

2000.times do
  Photo.create!(
    room_id: rooms_ids.sample,
    url: "http://placehold.it/#{width}x#{height}",
  )
end
