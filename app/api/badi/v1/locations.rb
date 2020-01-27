include ApplicationHelper

module Badi
  module V1
    class Locations < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :locations do
        desc 'Return list of possible locations'
        params do
          requires :location, type: String
        end
        get do
          location = params[:location]
          if location.nil? || location.blank? || location.length < 3
            incorrect_params
          end
          present LocationSearcher.call(location)
        end
      end
    end
  end
end
