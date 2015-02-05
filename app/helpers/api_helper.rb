# Helper methods defined here can be accessed in any controller or view in the application

module GrandPadrino
  class GrandPadrino
    module ApiHelper
      def get_json_params
        JSON.parse(env['rack.input'].gets).symbolize_keys
      end
    end

    helpers ApiHelper
  end
end
