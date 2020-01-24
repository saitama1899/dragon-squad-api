require 'rails_helper'

RSpec.describe 'room API', type: :request do

  let!(:rooms) { create_list(:room, 15) }

  # GET /rooms #######################
  describe 'GET /rooms' do
    before { get '/api/v1/rooms' }

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
  describe 'GET /rooms/:id' do
    before { get "/api/v1/rooms/#{room_id}" }

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

        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
      end
  end
end
