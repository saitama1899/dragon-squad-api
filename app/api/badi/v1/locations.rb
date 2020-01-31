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
          param_location = params[:location]

          locations = LocationSearcher.find_place(param_location)
          locations = JSON.parse(locations)

          results = []
          locations.each do |location_item|
            db_rooms = RoomSearcher.search_rooms_by_location_id(location_item['id'])
            if db_rooms.present?
              location_item[:total_rooms] = db_rooms.size
              results << location_item
            end
            present results
          end
        end
      end
    end
  end
end
