module Badi
  module Entities
    class RoomIndex < Grape::Entity
      expose :id, :title, :description, :price, :owner, :lat, :lng
      expose :first_photo, using: Badi::Entities::Photo do |rooms, options|
        rooms.photos.first
      end
    end
  end
end
