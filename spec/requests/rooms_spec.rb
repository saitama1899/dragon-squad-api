require 'rails_helper'

RSpec.describe 'room API', type: :request do

  let!(:rooms) { create_list(:room, 15) }

  # GET /rooms #######################
  describe 'GET /rooms' do
    before { get '/api/v1/admin/rooms' }

    it 'returns all rooms' do
      expect(json).not_to be_empty
      expect(json.size).to eq(15)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  let(:room_id) { rooms.first.id }

  # GET /rooms/:id ####################################
  describe 'GET /rooms/admin/:id' do
    before { get "/api/v1/admin/rooms/#{room_id}" }

      context 'when the record exists' do

        it 'returns the room' do
          expect(json).not_to be_empty
          expect(json['id']).to eq(room_id)
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end

      # Handle errors soon
      # context 'when the record does not exist' do
      #   let(:room_id) { 100 }

      #   it 'returns status code 404' do
      #     expect(response).to have_http_status(404)
      #   end
      # end
  end
  describe 'GET /rooms/room?:lat&:lon&:range' do
    context "URL Accepted" do

      it 'returns status code 200' do
        get "/api/v1/rooms?lat=42.00001&lon=0.0000&range=500"
        expect(response).to have_http_status(200)
      end

      it 'get  latitude, longitude and range' do
        get "/api/v1/rooms?lat=42.0000001&lon=0.0000&range=500"

        expect(request.params['lat'].to_f).to be_kind_of(Float)
        expect(request.params['lon'].to_f).to be_kind_of(Float)
        expect(request.params['range'].to_f).to be_kind_of(Float)
      end

      it 'get latitude, longitude, range and price price' do
        get "/api/v1/rooms?lat=42.0000001&lon=0.0000&range=500&price=20"

        expect(request.params['lat'].to_f).to be_kind_of(Float)
        expect(request.params['lon'].to_f).to be_kind_of(Float)
        expect(request.params['range'].to_f).to be_kind_of(Float)
        expect(request.params['price'].to_f).to be_kind_of(Float)
      end

      it 'returns a room list ' do
        get "/api/v1/rooms?lat=42.0000001&lon=0.0000&range=500&price=20"
          expect(json).to_not be_empty
      end

    end

    context "URL Not Accepted" do
      it 'returns status code 400 no params' do
        get "/api/v1/rooms"
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns status code 400 Invalid param name' do
        get "/api/v1/rooms?lot=42.0000001&lon=0.0000&range=500:"
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns status code 400 Invalid number of params' do
        get "/api/v1/rooms?lat=42.0000001&lon=0.0000:"
        expect(response).to have_http_status(:bad_request)
      end

    end
  end
end
