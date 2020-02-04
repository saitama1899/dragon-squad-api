# frozen_string_literal: true

module Badi
  module Entities
    class Room < Grape::Entity
      expose :id, :title, :description, :price, :owner, :visits
      expose :photos, using: Badi::Entities::Photo
    end
  end
end
