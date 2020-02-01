# frozen_string_literal: true

FactoryBot.define do
  factory :photo do
    url { Faker::Commerce.product_name }
    room_id { nil }
  end
end
