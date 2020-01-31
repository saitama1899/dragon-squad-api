require 'opencage/geocoder'
require 'json'

class RoomSearcher

  def self.rooms_filter(rooms_amount)
    rooms = []
    if rooms_amount.present?
      rooms = Badi::Entities::RoomIndex.represent(rooms_amount)
    end

    rooms
  end

  def self.search_rooms_by_location_id(location_id)
    result = Room.joins(:location).where(locations: {id: location_id})
    return rooms_filter(result)
  end

  def self.search_rooms_by_coordinates(lat, lng, range = 500)
    boundaries = Geocoder::Calculations.bounding_box([lat, lng], range / 1000)
    lat_range = (boundaries[0])..boundaries[2]
    lng_range = (boundaries[1])..boundaries[3]
    result = Room.joins(:location).where(locations: {lat: lat_range, lng: lng_range})
    return rooms_filter(result)
  end
  def self.call(lat,lng,range)
    Geocoder.configure(:units => :km)

    boundaries=Geocoder::Calculations.bounding_box([lat,lng],range/1000)
    result=Room.joins(:location).where(locations:{lat:boundaries[0]..boundaries[2],lng:boundaries[1]..boundaries[3]})
    rooms = []
    if result.present?
      rooms = Badi::Entities::RoomIndex.represent(result)
    end
    return rooms
  end
end
