require 'opencage/geocoder'
require 'json'

class LocationSearcher
  API_GEOCODE = OpenCage::Geocoder.new(api_key: ENV['API_KEY'])

  def self.find_place(location)
    possible_locations = Location.where("name ILIKE ?", "%#{location}%").first(5)

    results = []
    possible_locations.each do |item|
      results << {id: item.id, lat: item.lat, lng: item.lng, name: item.name }
    end

    return results
  end

  def self.reverse_geocode(lat, lng)
    API_GEOCODE.reverse_geocode(lat, lng)
  end
end
