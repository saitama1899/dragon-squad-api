# frozen_string_literal: true

require 'opencage/geocoder'
require 'json'

class RoomSearcher
  def self.search_rooms_by_coordinates(lat, lng, range = 1000)
    Geocoder.configure(units: :km)
    boundaries = Geocoder::Calculations.bounding_box([lat, lng], range / 1000)
    Room.joins(:location).where(locations: { lat: boundaries[0]..boundaries[2], lng: boundaries[1]..boundaries[3] })
  end

  def self.sort_results(rooms, params)
    order_by_price = params[:order_by_price] == 1 ? "asc" : "desc"
    popular = params[:popular] == 1 ? "desc" : "asc"

    if params[:max_price]
      rooms = rooms.where(['price <= :max_price', { max_price: params[:max_price] }])
    end

    if params[:order_by_price] && params[:popular]
      rooms = rooms.order("price #{order_by_price}, visits #{popular}")
    elsif params[:order_by_price]
      rooms = rooms.order("price #{order_by_price}")
    elsif params[:popular]
      rooms = rooms.order("visits #{popular}")
    end

    # [...]

    rooms
  end

  def self.pagination(rooms, params)
    page = params[:page]
    if page.present?
      if page < 0
        page = 1
      elsif page > rooms.page(page).total_pages
        page = rooms.page(page).total_pages
      end
      rooms = rooms.page(page)
    else
      rooms = rooms.page(1)
    end

    rooms
  end
end
