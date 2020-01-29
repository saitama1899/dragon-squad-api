require 'rails_helper'

describe Badi::V1::AdminRooms do
  let!(:location){create(:location)}
  let!(:rooms) { create_list(:room, 15,location_id:location.id) }

  # GET /admin/rooms
  describe 'GET /admin/rooms' do
    before { get '/api/v1/admin/rooms' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all rooms' do
      expect(json).not_to be_empty
      expect(json.size).to eq(15)
    end

    before { get '/api/v1/admin/rooms'}
      it 'returns rooms with price <= 1000' do
        json.length.times do |i|

        expect(json[i]['price'].to_d).to be_between(0.0, 1000.0).inclusive
      end
    end

  end

  let(:room_id) { rooms.first.id }

  # GET /admin/rooms/:id
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

    context 'when the record does not exist' do
      let(:room_id) { 100 }

      it 'returns status code 500' do
        expect(response).to have_http_status(500)
      end
    end

  end
end
