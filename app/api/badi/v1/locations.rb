module Badi
  module V1
    class Locations < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :locations do
        desc 'Return list of possible locations'
        get do
          place = params[:keyword]
          result = place.nil? || place.blank? || place.length < 3 ?
                       error!({ error: 'Incorrect params' }, 400) : LocationSearcher.call(place)
          present result
        end
      end
    end
  end
end
