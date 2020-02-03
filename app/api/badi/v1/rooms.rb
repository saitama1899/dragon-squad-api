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
            optional :price
          end

          with(type: Integer, allow_blank: { value: false, message: 'cannot be blank' }) do
            optional :p
          end
        end
        get do
          lat = params[:lat]
          lng = params[:lng]
          range = params[:range]
          page = params[:p]

          rooms = RoomSearcher.search_rooms_by_coordinates(lat, lng, range).order(visits: :desc)

          result = []

          if page.present?
            if page < 0
              page = 1
            elsif page > rooms.page(page).total_pages
              page = rooms.page(page).total_pages
            end
            result = rooms.page(page)
          else
            result = rooms.page(1)
          end
          present result, with: Badi::Entities::Room
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
