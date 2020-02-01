# frozen_string_literal: true

FactoryBot.define do
  factory :room do
    title { Faker::Marketing.buzzwords }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.number(digits: 3) }
    owner { Faker::Games::Pokemon.name }
    location_id { nil }
  end
end
