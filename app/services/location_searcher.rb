# frozen_string_literal: true

require 'opencage/geocoder'
require 'json'

class LocationSearcher
  API_GEOCODE = OpenCage::Geocoder.new(api_key: ENV['API_KEY'])

  def self.find_place(location)
    Location.where('name ILIKE ?', "%#{location}%").first(5)
  end

  def self.reverse_geocode(lat, lng)
    API_GEOCODE.reverse_geocode(lat, lng)
  end
end
