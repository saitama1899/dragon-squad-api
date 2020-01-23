module Badi
  module V1
    class Locations < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      PARAM_REQUEST_LOCATION = :keyword

      resource :locations do
        desc 'Return list of possible locations'
        get do
          present LocationSearcher.Search(params[PARAM_REQUEST_LOCATION])
        end
      end
    end
  end
end
