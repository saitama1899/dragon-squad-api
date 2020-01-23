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
      if item.components.key?(CITY_KEY) && item.components.key?(ROAD_KEY)
        results << { coordinates: item.coordinates, address: item.address }
      end
    end

    return results
  end
end
