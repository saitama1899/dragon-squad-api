module Badi
  class Api < Grape::API
    format :json
    content_type :json, 'application/json; charset=utf-8'

    mount Badi::Health
    # mount Badi::V1::Rooms
    mount Badi::V1::Searches
  end
end
