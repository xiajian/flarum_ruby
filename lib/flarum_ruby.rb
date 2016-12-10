require 'flarum_ruby/version'
require 'rest-client'
require 'logger'
require 'hashie'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/core_ext/hash/conversions'

module FlarumRuby
  autoload :Configure, File.expand_path('../flarum_ruby/configure', __FILE__)
  autoload :Base, File.expand_path('../flarum_ruby/base', __FILE__)

  class << self
    include Configure

    def default_user_info
      {
          identification: 'xiajian',
          password: '11111111'
      }
    end

    def get_user_token(params = {})
      options = default_user_info.merge(params)
      response = RestClient.post "#{api_url}/token", options

      Hashie::Mash.new JSON.parse(response)
    rescue => e
      logger.info "获取用户 token 发生异常: #{e}"

      return Hashie::Mash.new(JSON.parse(e.http_body))
    end
  end
end

Gem.find_files('flarum_ruby/*.rb').each { |path| require path }