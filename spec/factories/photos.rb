FactoryBot.define do
  factory :photo do
    url { Faker::Commerce.product_name }
    room_id {0} 
  end
end
