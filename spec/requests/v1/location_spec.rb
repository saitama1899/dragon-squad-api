require 'rails_helper'

URL = "/api/v1/locations"

describe 'GET locations', type: :request do
  before { get URL }
  it 'should return a 200 status code' do
    expect(response).to have_http_status(200)
  end

  it 'should return a text' do
    expect(json).not_to be_empty
  end

  it 'should return a json with keys' do
    payload = JSON.parse(response.body)
    expect(payload["foo"]).to eq("bar")
  end
end

