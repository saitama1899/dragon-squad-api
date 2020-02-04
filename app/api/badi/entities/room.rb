# frozen_string_literal: true

module Badi
  module Entities
    class Room < Grape::Entity
      expose :id, :title, :description, :price, :owner, :visits
      expose :bills_included, :deposit, :verified
      expose :roommate_girls, :roommate_boys
      expose :room_size, :property_size
      expose :photos, using: Badi::Entities::Photo
    end
  end
end
