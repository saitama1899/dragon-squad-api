# frozen_string_literal: true

FactoryBot.define do
  factory :room do
    title { Faker::Marketing.buzzwords }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.number(digits: 3) }
    owner { Faker::Games::Pokemon.name }
    bills_included{Faker::Boolean.boolean}
    deposit{Faker::Boolean.boolean}
    verified{Faker::Boolean.boolean}
    roommate_girls { Faker::Number.number(digits: 1) }
    roommate_boys { Faker::Number.number(digits: 1) }
    room_size { Faker::Number.number(digits: 2) }
    property_size { Faker::Number.number(digits: 3) }
    location_id { nil }
  end
end
