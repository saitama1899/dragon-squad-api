require 'opencage/geocoder'
require 'json'

class RoomSearcher

  def self.call(lat, lng, range = 5000)
    Geocoder.configure(:units => :km)
    boundaries = Geocoder::Calculations.bounding_box([lat, lng], range / 1000)
    lat_range = (boundaries[0])..boundaries[2]
    lng_range = (boundaries[1])..boundaries[3]
    result = Room.joins(:location).where(locations: {lat: lat_range, lng: lng_range}).limit(5)

    rooms = []
    if result.present?
      rooms = Badi::Entities::RoomIndex.represent(result)
    end

    return rooms
  end
end
