# frozen_string_literal: true

module Badi
  module V1
    class Locations < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :locations do
        desc 'Return list of possible locations'

        min_three_characters = /^.{3,}$/ # => "bar"
        params do
          requires :location, type: String, regexp: min_three_characters, allow_blank: { value: false, message: 'cannot be blank' }, message: 'is required'
          optional :countrycode
        end

        get do
          param_location = params[:location]
          result = LocationSearcher.find_place(param_location)
          present result, with: Badi::Entities::Location
        end
      end
    end
  end
end
