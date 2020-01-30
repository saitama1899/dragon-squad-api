require 'opencage/geocoder'
require 'json'

class RoomSearcher

  def self.call(location_id)
    result = Room.joins(:location).where(locations: {id: location_id}).limit(5)

    rooms = []
    if result.present?
      rooms = Badi::Entities::RoomIndex.represent(result)
    end

    return rooms
  end
end
