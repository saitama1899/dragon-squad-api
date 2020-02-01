# frozen_string_literal: true

module ApplicationHelper
  require 'faraday'
  require 'json'

  def suggest_locations(keyword)
    url = 'http://localhost:3000/api/v1/locations'
    request = Faraday.get(url, location: keyword)
    results = JSON.parse(request.body)
  end
end
