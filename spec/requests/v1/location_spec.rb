require 'rails_helper'

describe 'GET locations', type: :request do
  it 'should return a 200 status code' do
    get '/api/v1/locations'

    expect(response).to have_http_status(404)
  end
end

