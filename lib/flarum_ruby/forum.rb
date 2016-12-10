module FlarumRuby
  class Forum < Base
    class << self
      def api_url
        "#{FlarumRuby.api_url}/forum"
      end

      def index
        api_endpoint api_url, :get
      end

      def update(params = {})
        api_endpoint api_url, :patch, params
      end
    end
  end
end
