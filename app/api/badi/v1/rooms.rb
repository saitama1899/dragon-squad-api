module Badi
  module V1
    class Rooms < Grape::API
      version 'v1', using: :path
      format :json

      prefix :api

      # /admin/rooms #
      namespace :admin do
        resource :rooms do
          desc 'Returns a list of rooms'
          get do
            rooms = Room.all
            present rooms, with: Badi::Entities::RoomIndex
          end

          desc 'Returns a specific room'
          route_param :id do
            get do
              room = Room.find(params[:id])
              present room, with: Badi::Entities::Room
            end
          end
        end
      end

      # /rooms?lat=x&lng=x&range=x #
      resource :rooms do
        desc 'Returns a list of rooms that are within the boundaries'
        params do
          requires :lat, type: Float
          requires :lng, type: Float
          requires :range, type: Float
          optional :price, type: Float
        end
        get do
          lat = params[:lat]
          lng = params[:lng]
          range = params[:range]

          Geocoder.configure(:units => :km)
          boundaries = Geocoder::Calculations.bounding_box([lat, lng], range/1000)
          rooms = Room.all.where({ lat: boundaries[0]..boundaries[2], lng: boundaries[1]..boundaries[3] })
          present rooms, with: Badi::Entities::RoomIndex
        end
      end

    end
  end
end
