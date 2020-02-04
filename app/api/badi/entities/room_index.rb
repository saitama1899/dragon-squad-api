# frozen_string_literal: true

module Badi
  module Entities
    class RoomIndex < Grape::Entity
      expose :title, :description, :price, :owner, :location_id, :visits, :deposit, :bills_included
      expose :first_photo, using: Badi::Entities::Photo do |rooms, _options|
        rooms.photos.first
      end
    end
  end
end
