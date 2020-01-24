module Badi
  module Entities
    class RoomIndex < Grape::Entity
      expose :id
      expose :title
      expose :description
      expose :price
      expose :owner
    end
  end
end
