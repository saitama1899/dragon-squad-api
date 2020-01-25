module Badi
  class Api < Grape::API
    format :json
    content_type :json, 'application/json; charset=utf-8'

    # Error handling
    rescue_from :all

    mount Badi::Health
    mount Badi::V1::AdminRooms
    mount Badi::V1::Rooms
    mount Badi::V1::Locations
  end
end
