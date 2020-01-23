require 'opencage/geocoder'
require 'json'

class LocationSearcher
  KEY = 'a07e1766190643b79d64cf4ea64ab4b3'
  API_GEOCODE = OpenCage::Geocoder.new(api_key: KEY)
  CITY_KEY = "city"
  ROAD_KEY = "road"

  def self.Search(location)
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
