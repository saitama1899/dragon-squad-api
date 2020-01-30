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
          with(type: Float, allow_blank: {value: false, message: 'cannot be blank'}) do
            requires :lat, :lng, :range
          end

          two_decimals = /^\d+\.?\d{0,2}$/ # => 99.00
          with(regexp: two_decimals) do
            requires :range
            optional :price
          end

        end
        get do
          lat = params[:lat]
          lng = params[:lng]
          range = params[:range]

          rooms = RoomSearcher.call(lat, lng, range)

          present rooms
        end
      end

    end
  end
end
