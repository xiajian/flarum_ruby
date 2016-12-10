module FlarumRuby
  class Discussion < Base
    class << self
      def api_url
        "#{FlarumRuby.api_url}/discussions"
      end

      def index
        api_endpoint self.api_url, :get
      end

      def create(params = {})

      end

      def update(params = {})
        
      end

      def destroy(params = {})
        
      end
    end
  end
end
