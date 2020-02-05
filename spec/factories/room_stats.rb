# frozen_string_literal: true

FactoryBot.define do
  factory :room_stat do
    room { nil }
    request_ip { '0.0.0.0' }
  end
end
