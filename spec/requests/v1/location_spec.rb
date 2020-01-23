require 'rails_helper'

URL = "/api/v1/locations?keyword=Consell de cent"

describe 'GET locations', type: :request do
  before { get URL }
  it 'should return a 200 status code' do
    expect(response).to have_http_status(200)
  end

  it 'should return a text' do
    expect(json).not_to be_empty
  end
end

