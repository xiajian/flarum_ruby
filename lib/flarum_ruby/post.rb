module FlarumRuby
  class Post < Base
    class << self
      def api_url
        "#{FlarumRuby.api_url}/posts"
      end

      def index
        params = {
            filter: {
                user: 2,
                number: 2
            }
        }
        api_endpoint api_url, :get, params
      end

      def show
        
      end

      # 主要是
      def create(params = {})
        # 设置参数
        api_endpoint self.api_url, :post, params
      end

      def update

      end

      def destroy

      end

    end
  end
end
