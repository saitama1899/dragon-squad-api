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

    if params[:cheap]
      rooms = rooms.order(price: :asc)
    end

    if params[:max_price]
      rooms = rooms.where(["price <= :max_price", { max_price: params[:max_price] }])
    end

    if params[:popular]
      rooms = rooms.order(visits: :desc)
    end

    # [...]

    return rooms
  end

  def self.pagination(rooms)

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

    return rooms
  end
end
