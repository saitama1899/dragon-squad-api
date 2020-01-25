require 'database_cleaner'
# This cleans after each rails db:seeds
DatabaseCleaner.clean_with(:truncation)

20.times do
  Room.create!(
    title: Faker::Marketing.buzzwords,
    description: Faker::Lorem.paragraph,
    price: Faker::Number.number(digits: 3),
    owner: Faker::Games::Pokemon.name,
    lat: Faker::Address.latitude,
    lng: Faker::Address.longitude
  )
end

rooms_ids = Room.ids

100.times do
    Photo.create!(
        room_id: rooms_ids.sample,
        url: "http://placehold.it/#{Faker::Number.number(digits: 3)}x#{Faker::Number.number(digits: 3)}",
    )
end
