module V1
  module Helpers
    module ErrorHandler
      extend Grape::API::Helpers
      extend ActiveSupport::Concern
      include Response

      included do

        rescue_from ActiveRecord::RecordNotFound do |e|
          json_response({ message: e.message}, :not_found)
        end

      end

    end
  end
end
