module FlarumRuby
  class Group < Base
    class << self
      def api_url
        "#{FlarumRuby.api_url}/groups"
      end

      def index
        api_endpoint api_url, :get
      end

      def update
        api_endpoint api_url, :post
      end

      def show(params = {})
        api_endpoint api_url, :get, params
      end

      def destroy(params = {})
        api_endpoint api_url, :delete, params
      end

    end
  end
end
