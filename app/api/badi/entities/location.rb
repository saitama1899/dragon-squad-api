module Badi
  module Entities
    class Location < Grape::Entity
      expose :id, :lat, :lng, :name
    end
  end
end
