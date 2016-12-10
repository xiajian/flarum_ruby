module FlarumRuby
  class Base
    extend Configure
    class << self
      def api_endpoint(api_url, method, options = {})
        body = options.delete(:body) || {}
        headers = options.delete(:headers) || {}
        user_info = options.delete(:user) || {}
        headers.merge!(Authorization: "Token #{FlarumRuby.get_user_token(user_info).token}")

        response = RestClient::Request.execute(method: method, url: api_url, payload: body, headers: headers)

        logger.info "response: #{response}"

        Hashie::Mash.new(JSON.parse(response))
      rescue => e
        if e.is_a? RestClient::ExceptionWithResponse
          logger.info "Response Code: #{e.message}"
          logger.info "Response Boby: #{e.http_body}"
        else
          logger.info e
        end
      end
    end
  end
end
