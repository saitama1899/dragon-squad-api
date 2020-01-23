require 'opencage/geocoder'
require 'json'

class LocationSearcher
  def self.Search(location)
    string = JSON.parse '{"foo":"bar", "ping":"pong"}'
    return string
  end
end
