module Badi
  module V1
    class Locations < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :locations do
        desc 'Return list of possible locations'

        params do
          requires :location, type: String, regexp: /^.{3,}$/, allow_blank: { value: false, message: 'cannot be blank' }, message: 'is required'
        end

        get do
          place = params[:location]
          present LocationSearcher.call(place)
        end
      end
    end
  end
end
