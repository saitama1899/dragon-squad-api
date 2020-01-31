require 'opencage/geocoder'
require 'json'

class RoomSearcher

  def self.find_rooms_by_location_id(location_id)
    Badi::Entities::RoomIndex.represent(Room.joins(:location).where(locations: {id: location_id}))
  end
end
