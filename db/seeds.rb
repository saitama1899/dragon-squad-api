10.times do
  Room.create!(
    title: Faker::Marketing.buzzwords,
    description: Faker::Lorem.paragraph,
    price: Faker::Number.number(digits: 3),
    owner: Faker::Games::Pokemon.name,
    lat: Faker::Address.latitude,
    lng: Faker::Address.longitude
  )
end
