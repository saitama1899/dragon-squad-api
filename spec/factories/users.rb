FactoryBot.define do
  factory :user do
    name { Faker::Artist.name }
    email { Faker::Internet.email  }
    username { Faker::Name.unique.initials }
    password_digest { 'pass' }
    location_id { nil }
  end
end
