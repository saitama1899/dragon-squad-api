module Badi
  module Entities
    class Room < Grape::Entity
      expose :id
      expose :title
      expose :description
      expose :price
      expose :owner
      expose :lat
      expose :lng
      expose :photos, using: Badi::Entities::Photo
    end
  end
end
