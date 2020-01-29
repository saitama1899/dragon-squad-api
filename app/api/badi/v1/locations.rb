module Badi
  module V1
    class Locations < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :locations do
        desc 'Return list of possible locations'

        min_three_characters = /^.{3,}$/ # => "bar"
        params do
          requires :location, type: String, regexp: min_three_characters, allow_blank: {value: false, message: 'cannot be blank'}, message: 'is required'
          optional :countrycode
        end

        get do
          location = params[:location]
          country = params[:countrycode]
          places = LocationSearcher.forward_search(location, country)

          results = []

          places.each do |item|
            db_rooms = RoomSearcher.call(item[:coordinates].first, item[:coordinates].last)
            if db_rooms.present?
              item[:total_rooms] = db_rooms.first.size
              item[:rooms] = db_rooms.first
              results << item
            end
          end
          present results
        end
      end
    end
  end
end
