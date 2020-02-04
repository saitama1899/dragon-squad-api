# frozen_string_literal: true

require 'rails_helper'

describe Badi::V1::Rooms do
  let!(:locationOne) { create(:location) }
  let!(:rooms) { create_list(:room, 15, location_id: locationOne.id) }
  url = '/api/v1/rooms'

    describe 'Get /:id' do
      # Good Context
      context 'URL accepted' do
        it 'should return status ok' do
          get "#{url}/#{rooms.first.id}"

          expect(response).to have_http_status(200)
        end

        it 'should return json room' do
          get "#{url}/#{rooms.first.id}"

          expect(json['id']).to eq(rooms.first.id)
        end
        it 'should return visits 1' do
          get "#{url}/#{rooms.first.id}"

          expect(json['visits']).to eq(1)
        end
      end
      # Bad Context
    end

  describe 'GET /rooms?lat=x&lng=x&range=x' do
    # Good context
    context 'URL Accepted' do
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

      let!(:location) { create(:location, lat: 42.00301, lng: 0.003) }

      let!(:locationWrong) { create(:location, lat: 53.00301, lng: 0.003) }

      let!(:room) { create_list(:room, 2, location_id: location.id) }
      let!(:wrong_room) { create_list(:room, 2, location_id: locationWrong.id) }

      it 'returns a room list' do
        get "#{url}?lat=42.0000001&lng=0.0000&range=500&price=20"
        expect(json).to_not be_empty
        expect(json.size).to eq(2)
      end
    end

    # Bad context
    context 'URL Not Accepted' do
      it 'returns status code 400 no params' do
        get url.to_s
        expect(response).to have_http_status(:bad_request)
      end

      it 'should contain an error message' do
        get "#{url}?lat=AA&lng=bb&range=-1&price=-2"
        expect(json.first['messages'].first.to_s) == 'is required'
        expect(json.first['messages'].first.to_s) == 'is invalid'
        expect(json.first['messages'].last.to_s) == 'cannot be blank'
      end

      it 'returns status code 400 Invalid param name' do
        get "#{url}?lot=42.0000001&lng=0.0000&range=500:"
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns status code 400 Invalid number of params' do
        get "#{url}?lat=42.0000001&lng=0.0000:"
        expect(response).to have_http_status(:bad_request)
      end

      let!(:locationTwo) { create(:location, lat: 53.00301, lng: 0) }
      let!(:room) { create_list(:room, 2, location_id: locationTwo.id) }
      it 'returns a void room list' do
        get "#{url}?lat=42.0000001&lng=0.0000&range=500&price=20"
        expect(json).to be_empty
      end
    end
  end
  describe 'GET /rooms?lat=x&lng=x&range=x&p=x' do
    # good context
    let!(:location) { create(:location, lat: 42.00301, lng: 0.003) }

    let!(:locationWrong) { create(:location, lat: 53.00301, lng: 0.003) }

    let!(:roomFirst) { create_list(:room, 20, title: 'First', location_id: location.id) }
    let!(:roomSecond) { create_list(:room, 20, title: 'Second', location_id: location.id) }
    let!(:roomThird) { create_list(:room, 15, title: 'Third', location_id: location.id) }
    let!(:wrong_room) { create_list(:room, 60, location_id: locationWrong.id) }
    # Good Context
    context 'URL ACCEPT' do
      it 'should return 20 rooms' do
        get "#{url}?lat=42.0000001&lng=0.0000&range=500"
        expect(json.size).to eq(20)
      end
      it 'should return first 20 rooms' do
        get "#{url}?lat=42.0000001&lng=0.0000&range=500"

        expect(json.first['title']).to eq('First')
      end
      it 'should return Second 20 rooms' do
        get "#{url}?lat=42.0000001&lng=0.0000&range=500&page=2"
        # print json.first["title"]
        expect(json.first['title']).to eq('Second')
      end

      it 'should return third 20 rooms even with a out of range page' do
        get "#{url}?lat=42.0000001&lng=0.0000&range=500&page=4"
        expect(json.first['title']).to eq('Third')
      end
      it 'should return third 20 rooms even with a out of range page' do
        get "#{url}?lat=42.0000001&lng=0.0000&range=500&page=3"
        expect(json.size).to eq(15)
      end
    end
  end

  describe 'GET /rooms?lat=x&lng=x&range=x&max_price=500&popular=1&order_by_price=1' do
    lat = 40.43442881674111
    lng = -3.548318834259536

    let!(:location) { create(:location, lat: lat, lng: lng) }
    let!(:rooms) do [
      create(:room, title: 'Most expensive room', price: 600, visits: 67,  location_id: location.id),
      create(:room, title: 'Expensive room', price: 500, visits: 7, location_id: location.id),
      create(:room, title: 'Room', price: 400, visits: 45, location_id: location.id),
      create(:room, title: 'Cheap room', price: 300, visits: 3, location_id: location.id),
      create(:room, title: 'Cheapest room', price: 200, visits: 36, location_id: location.id)
    ] end
    bounds = "?lat=#{lat}&lng=#{lng}&range=1000"

    context 'URL ACCEPT' do
      it 'should return 4 rooms (less than 600 price)' do
        get "#{url + bounds}&max_price=550"
        expect(json.size).to eq(4)
      end
      it 'should return the first room with price 200' do
        get "#{url + bounds}&order_by_price=1"
        expect(json.first['title']).to eq('Cheapest room')
      end
      it 'should return the first room with price 600' do
        get "#{url + bounds}&order_by_price=0"
        expect(json.first['title']).to eq('Most expensive room')
      end
      it 'should return the first room with more visits' do
        get "#{url + bounds}&popular=1"
        expect(json.first['visits']).to eq(67)
      end
      it 'should return the first room with less visits' do
        get "#{url + bounds}&popular=0"
        expect(json.first['visits']).to eq(3)
      end
      it 'should return the first room with more visits and max price 300' do
        get "#{url + bounds}&popular=1&max_price=300"
        expect(json.first['visits']).to eq(36)
      end
      it 'should return the first room with more visits, max price 500, order by price desc' do
        get "#{url + bounds}&popular=1&max_price=500&order_by_price=0"
        expect(json.first['title']).to eq("Expensive room")
      end
      it 'should return the first room with max price 600, order by price asc' do
        get "#{url + bounds}&max_price=600&order_by_price=1"
        expect(json.first['title']).to eq("Cheapest room")
      end

    end
  end
end
