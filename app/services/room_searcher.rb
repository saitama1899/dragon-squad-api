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

    order_by_price = params[:order_by_price]
    if order_by_price == 1
      rooms = rooms.order(price: :asc)
    elsif order_by_price == 0
      rooms = rooms.order(price: :desc)
    end

    if params[:max_price]
      rooms = rooms.where(["price <= :max_price", { max_price: params[:max_price] }])
    end

    popular = params[:popular]
    if popular == 1
      rooms = rooms.order(visits: :desc)
    elsif popular == 0
      rooms = rooms.order(visits: :asc)
    end

    rooms = rooms.where({ deposit: params[:bills].present?   ? true : false })
    rooms = rooms.where({ deposit: params[:deposit].present? ? true : false })


    return rooms
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

    return rooms
  end
end
