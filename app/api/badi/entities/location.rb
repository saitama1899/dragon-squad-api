module Badi
  module Entities
    class Location < Grape::Entity
      expose :id, :name, :lat, :lng
    end
  end
end

