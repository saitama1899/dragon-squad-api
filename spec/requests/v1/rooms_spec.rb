require 'rails_helper'

describe Badi::V1::Rooms do
  let!(:locationOne){create(:location)}
  let!(:rooms) { create_list(:room, 15,location_id: locationOne.id) }
  url = "/api/v1/rooms"

  describe 'Get /:id' do
    #Good Context
    context "URL accepted" do

      it "should return status ok" do
        get "#{url}/#{rooms.first.id}"

        expect(response).to have_http_status(200)
      end

      it "should return json room" do
        get "#{url}/#{rooms.first.id}"

        expect(json['id']).to eq(rooms.first.id)
      end
    end

    #Bad Context
  end

  describe 'GET /rooms?lat=x&lng=x&range=x' do
    # Good context
    context "URL Accepted" do

      it 'returns status code 200' do
        get "#{url}?lat=42.00001&lng=0.0000&range=500"
        expect(response).to have_http_status(200)
      end

      it 'returns status code 200' do
        get "#{url}?lat=42.00001&lng=0.0000&range=50.00&price=20.00"
        expect(response).to have_http_status(200)
      end

      it 'get latitude, longitude and range' do
        get "#{url}?lat=42.0000001&lng=0.0000&range=500"

        expect(request.params['lat'].to_f).to be_kind_of(Float)
        expect(request.params['lng'].to_f).to be_kind_of(Float)
        expect(request.params['range'].to_f).to be_kind_of(Float)
      end

      let!(:location) { create(:location, lat: 42.00301, lng: 0.003)}


      let!(:locationWrong) { create(:location, lat: 53.00301, lng: 0.003)}

      let!(:room){ create_list(:room, 2, location_id:location.id) }
      let!(:wrong_room){ create_list(:room, 2,location_id:locationWrong.id) }

      it 'returns a room list' do
        get "#{url}?lat=42.0000001&lng=0.0000&range=500&price=20"
        expect(json).to_not be_empty
        expect(json.size).to eq(2)
      end
    end

    # Bad context
    context "URL Not Accepted" do
      it 'returns status code 400 no params' do
        get "#{url}"
        expect(response).to have_http_status(:bad_request)
      end

      it 'should contain an error message' do
        get "#{url}?lat=AA&lng=bb&range=-1&price=-2"
        expect(json.first["messages"].first.to_s) == "is required"
        expect(json.first["messages"].first.to_s) == "is invalid"
        expect(json.first["messages"].last.to_s) == "cannot be blank"
      end

      it 'returns status code 400 Invalid param name' do
        get "#{url}?lot=42.0000001&lng=0.0000&range=500:"
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns status code 400 Invalid number of params' do
        get "#{url}?lat=42.0000001&lng=0.0000:"
        expect(response).to have_http_status(:bad_request)
      end

      let!(:locationTwo) { create(:location, lat: 53.00301, lng: 0)}
      let!(:room){ create_list(:room, 2,location_id:locationTwo.id) }
      it 'returns a void room list' do
        get "#{url}?lat=42.0000001&lng=0.0000&range=500&price=20"
        expect(json).to be_empty
      end

    end
  end
end
