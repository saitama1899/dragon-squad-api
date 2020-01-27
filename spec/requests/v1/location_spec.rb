require 'rails_helper'

describe Badi::V1::Locations do

  url = "/api/v1/locations"

  context 'Get /locations from a search' do

    place = Faker::Address.postcode
    before { get "#{url}?location=#{place}" }

    it 'should return a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'should return a text' do
      expect(json).not_to be_empty
    end

    it 'should contain specific keys' do
      expect(json.first.key?("coordinates"))
      expect(json.first.key?("address"))
    end

    it 'key should contain values in the desired format' do
      expect(json.first["coordinates"].first.to_f).to be_kind_of(Float)
      expect(json.first["coordinates"].last.to_f).to be_kind_of(Float)

      expect(json.first["address"]).not_to be_empty
    end

  end

  context 'Bad parameters' do
    before { get "#{url}?location=ba" }

    it 'should return a 400 status code' do
      expect(response).to have_http_status(400)
    end

    it 'should return a text' do
      expect(json).not_to be_empty
    end

    it 'should contain an error param' do
      expect(json.first["params"].first.to_s) == "location"
    end

    it 'should contain an error message' do
      expect(json.first["messages"].first.to_s) == "must be at least 3 characters long"
    end

  end

  context 'No parameters' do

    before { get url }

    it 'should return a 400 status code' do
      expect(response).to have_http_status(400)
    end

    it 'should return a text' do
      expect(json).not_to be_empty
    end

    it 'should contain an error param' do
      expect(json.first["params"].first.to_s) == "location"
    end

    it 'should contain an error message' do
      expect(json.first["messages"].first.to_s) == "is required"
      expect(json.first["messages"].last.to_s) == "cannot be blank"
    end

  end

end
