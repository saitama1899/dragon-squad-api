module ApplicationHelper
  require 'faraday'
  require 'json'



  def suggest_locations(keyword)
    url = 'http://localhost:3000/api/v1/locations'
    request = Faraday.get(url, {location: keyword})
    # url = "http://localhost:3000/api/v1/rooms?lat=40.43442881674111&lng=-3.548318834259536&range=5000 "
    # request = Faraday.get url
    # puts request.body
    puts JSON.parse(request.body)['address']

    # arr = []
    # results.each do |child|
    #   arr << child['components']
    # end

    # return arr
  end
end
