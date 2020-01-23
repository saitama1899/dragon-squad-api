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
    end
  end
end
