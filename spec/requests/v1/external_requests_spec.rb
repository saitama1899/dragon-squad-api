# frozen_string_literal: true

require 'rails_helper'
# rspec ./spec/requests/v1/external_requests_spec.rb

feature 'OpenCage external request' do
  it 'queries for a location' do
    stub_request(:get, 'https://api.opencagedata.com/geocode/v1/json?key=a07e1766190643b79d64cf4ea64ab4b3&q=mad')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Host' => 'api.opencagedata.com',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: '', headers: {})
  end
end
