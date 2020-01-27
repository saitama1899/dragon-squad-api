include ApplicationHelper

module Badi
  module V1
    class Rooms < Grape::API
      version 'v1', using: :path
      format :json

      prefix :api

      resource :rooms do
        desc 'Returns a list of rooms that are within the boundaries'
        params do
          with(type: Float, allow_blank: { value: false, message: 'cannot be blank' }) do
            requires :lat, :lng, :range
          end

          with(regexp: /^\d+\.?\d{0,2}$/) do
            requires :range
            optional :price
          end

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
