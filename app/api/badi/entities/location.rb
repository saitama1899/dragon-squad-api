# frozen_string_literal: true

module Badi
  module Entities
    class Location < Grape::Entity
      expose :id, :lat, :lng, :name, :total_rooms
    end
  end
end
