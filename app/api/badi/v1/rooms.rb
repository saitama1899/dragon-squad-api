module Badi
  module V1
    class Rooms < Grape::API
      version 'v1', using: :path
      # Tell our API that we allow only JSON
      format :json
      # We prefix the path of our API. Remind you, in route.rb we set route like that mount Badi::API => '/'
      # With this prefix we could access to our API instead '/api'

      prefix :api
      # namespace used for parents routes
      namespace :admin do
        # Indicates rooms routes
        resource :rooms do
          # Description of our method and what we are expecting
          desc 'Return list of rooms'
          get  do

            # Method to return all rooms
            rooms = Room.all
            present rooms, with: Badi::Entities::Room
          end

          desc 'Return a specific room'
          # route_param :id Allows us to define namespace to pick up a room thanks to its id
          route_param :id do
            get do
              room = Room.find(params[:id])
              present room, with: Badi::Entities::Room
            end
          end
        end
      end

      resource :rooms do
        desc 'Return list of rooms inside the boundaries'
        params do
          requires :lat, type: Float
          requires :lon, type: Float
          requires :range, type: Float
          optional :price, type: Float
        end
        get  do


        end
      end

    end
  end
end
