require 'rails_helper'

URL_STREET = "/api/v1/locations?keyword=Consell de cent"
URL_EMPTY = "/api/v1/locations"

describe 'OpenCage request for street', type: :request do
  before { get URL_STREET }
  it 'should return a 200 status code' do
    expect(response).to have_http_status(200)
  end

  it 'should return a text' do
    expect(json).not_to be_empty
  end

  it 'should contain coordinates' do
    result = JSON.parse(response.body)
    expect(result.first.key?("coordinates"))
  end

  it 'should contain address' do
    result = JSON.parse(response.body)
    expect(result.first.key?("address"))
  end
end

##################################################################
describe 'OpenCage empty request', type: :request do
  before { get URL_EMPTY }

  it 'should return a text' do
    expect(json).not_to be_empty
  end

  it 'should return a bad request' do
    payload = JSON.parse(response.body)
    expect(payload["error"]) == "No results"
  end

end
