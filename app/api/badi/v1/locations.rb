module Badi
  module V1
    class Locations < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :locations do
        desc 'Return list of possible locations'
        get do
          present LocationSearcher.call(params[:keyword])
        end
      end
    end
  end
end
