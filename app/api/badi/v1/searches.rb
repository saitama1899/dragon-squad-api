module Badi
  module V1
    class Searches < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      PARAM_REQUEST_LOCATION = :keyword

      resource :searches do
        desc 'Return list of possible locations'
        get do
          present LocationSearcher.Search(params[PARAM_REQUEST_LOCATION])
        end
      end
    end
  end
end
