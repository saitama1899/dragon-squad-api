# frozen_string_literal: true

module Badi
  module V1
    class AdminRooms < Grape::API
      version 'v1', using: :path
      format :json

      prefix :api

      # /admin/rooms
      namespace :admin do
        resource :rooms do
          desc 'Returns a list of rooms'
          get do
            rooms = Room.all
            present rooms, with: Badi::Entities::Room
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
    end
  end
end
