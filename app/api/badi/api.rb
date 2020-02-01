# frozen_string_literal: true

module Badi
  class Api < Grape::API
    format :json
    content_type :json, 'application/json; charset=utf-8'

    rescue_from Grape::Exceptions::ValidationErrors do |error_message|
      error!(error_message, 400)
    end
    # Error handle for JWT decode error
    # rescue_from JWT::DecodeError do |error_message|
    # error!(error_message,:unauthorized)
    # end

    # Error handling
    rescue_from :all

    mount Badi::Health
    mount Badi::V1::AdminRooms
    mount Badi::V1::Rooms
    mount Badi::V1::Locations
    mount Badi::V1::Users
  end
end
