# frozen_string_literal: true

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

          two_decimals = /^\d+\.?\d{0,2}$/ # => 99.00
          with(regexp: two_decimals) do
            requires :range
          end

          with(type: Integer, allow_blank: { value: false, message: 'cannot be blank' }) do
            optional :max_price
            optional :page
            optional :cheap
            optional :popular
          end
        end

        get do
          lat = params[:lat]
          lng = params[:lng]
          range = params[:range]

          rooms = RoomSearcher.search_rooms_by_coordinates(lat, lng, range)

          rooms = RoomSearcher.sort_results(rooms, request.GET)

          rooms = RoomSearcher.pagination(rooms)

          present rooms, with: Badi::Entities::RoomIndex
        end

        desc 'Returns a specific room'
        route_param :id do
          get do
            stat = RoomStat.new
            stat.room_id = params[:id]
            stat.request_ip = env['REMOTE_ADDR']
            room = Room.find(params[:id])
            rs = RoomStat.where(['room_id = ? and request_ip = ?', stat.room_id, stat.request_ip])
            if rs.size <= 1
              room.visits += 1
              room.save
            end

            present room, with: Badi::Entities::Room
          end
        end
      end
    end
  end
end
