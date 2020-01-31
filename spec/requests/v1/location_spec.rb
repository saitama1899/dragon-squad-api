require 'rails_helper'

describe Badi::V1::Locations do

  url = "/api/v1/locations"

  describe "Right params" do
    context "Location with rooms" do
      before { get "#{url}?location=mad" }

      it "should return status ok" do
        expect(response).to have_http_status(200)
      end
      let!(:location) { create(:location, name:'madrid')}
      it 'should return a text' do
        expect(json).to_not be_empty
      end

      # test params en json

    end
  end

  describe "Bad parameters" do
    context 'Incorrect params' do
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
end
