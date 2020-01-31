require 'opencage/geocoder'
require 'json'

class RoomSearcher

  def self.call(location_id)
    result = Room.joins(:location).where(locations: {id: location_id})

    rooms = []
    if result.present?
      rooms = Badi::Entities::RoomIndex.represent(result)
    end

    return rooms
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
