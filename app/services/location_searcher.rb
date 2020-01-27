require 'opencage/geocoder'
require 'json'

class LocationSearcher
  API_GEOCODE = OpenCage::Geocoder.new(api_key: ENV['API_KEY'])

  CITY_KEY = "city"
  ROAD_KEY = "road"

  def self.call(location, country)
    possible_locations = API_GEOCODE.geocode(location, country_code: country, language: 'es')

    results = []
    possible_locations.each do |item|
      results << { coordinates: item.coordinates, address: item.address }
    end

    return results
  end

  def self.reverse_geocode(lat, lng)
    API_GEOCODE.reverse_geocode(lat, lng)
  end
end
