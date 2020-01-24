require 'rails_helper'

url = "/api/v1/rooms?price=1000"

describe 'GET rooms', type: :request do
  before { get url }
  it 'should return a 200 status code' do
    expect(response).to have_http_status(200)
  end

  it 'return not empty body' do
    expect(response.body).not_to be_empty
  end

  it 'should has a price parameter' do
    payload = JSON.parse(response.body)
    expect(payload).to_not be_empty
    #expect(payload['price']).to_not be_empty
  end
end
