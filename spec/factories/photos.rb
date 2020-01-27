FactoryBot.define do
  factory :photo do
    url { Faker::Commerce.product_name }
    room_id {1}
  end
end
