require 'opencage/geocoder'
require 'json'

class RoomSearcher
  def self.search_rooms_by_location_id(location_id)
    result = Room.joins(:location).where(locations: {id: location_id})
    Badi::Entities::RoomIndex.represent(result)
  end

  def self.search_rooms_by_coordinates(lat, lng, range = 1000)
    Geocoder.configure(:units => :km)
    boundaries = Geocoder::Calculations.bounding_box([lat, lng], range / 1000)
    result = Room.joins(:location).where(locations:{lat:boundaries[0]..boundaries[2],lng:boundaries[1]..boundaries[3]})
    Badi::Entities::RoomIndex.represent(result)
  end
end
