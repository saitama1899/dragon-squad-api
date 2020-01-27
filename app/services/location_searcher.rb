require 'opencage/geocoder'
require 'json'

class LocationSearcher
  API_GEOCODE = OpenCage::Geocoder.new(api_key: ENV['API_KEY'])
  CITY_KEY = "city"
  ROAD_KEY = "road"

  def self.call(location)
    possible_locations = API_GEOCODE.geocode(location)

    results = []
    possible_locations.each do |item|
      results << { coordinates: item.coordinates, address: item.address }
    end

    return results
  end
end
