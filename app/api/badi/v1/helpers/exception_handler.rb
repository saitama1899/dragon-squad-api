module Helpers
  module ExceptionHandler
    # extend Grape::API::Helpers
    extend ActiveSupport::Concern

    class Grape::Middleware::Error
      def error_message(code, text)
        {
          :error => {
            :code => code.to_s,
            :message => text
          }
        }.to_json
      end
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      rack_response(error_message(:not_found, 'Record was not found'), 404)
    end
  end
end
