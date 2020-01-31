require 'opencage/geocoder'
require 'json'

class RoomSearcher

  def self.search_rooms_by_location_id(location_id)
    Room.joins(:location).where(locations: {id: location_id})
  end

  def self.search_rooms_by_coordinates(lat, lng, range = 1000)
    Geocoder.configure(:units => :km)
    boundaries = Geocoder::Calculations.bounding_box([lat, lng], range / 1000)
    lat_range = (boundaries[0])..boundaries[2]
    lng_range = (boundaries[1])..boundaries[3]
    Room.joins(:location).where(locations: {lat: lat_range, lng: lng_range})
  end

end
