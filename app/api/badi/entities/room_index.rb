module Badi
  module Entities
    class RoomIndex < Grape::Entity
      expose : :title, :description, :price, :owner, :location_id
      expose :first_photo, using: Badi::Entities::Photo do |rooms, options|
        rooms.photos.first
      end
    end
  end
end
