FactoryBot.define do
  factory :location do
    name { Faker::Address.city }
    lat { Faker::Number.normal(mean: 40.4, standard_deviation: 0.25) }
    lng { Faker::Number.normal(mean: -3.7, standard_deviation: 0.25) }
  end
end
