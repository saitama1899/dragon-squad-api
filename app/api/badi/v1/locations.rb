include ApplicationHelper

module Badi
  module V1
    class Locations < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :locations do
        desc 'Return list of possible locations'

        get do
          place = params[:location]
          if place.nil? || place.blank? || place.length < 3
            incorrect_params
          end
          present LocationSearcher.call(place)
        end
      end
    end
  end
end
