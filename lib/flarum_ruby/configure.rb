module FlarumRuby
  module Configure
    mattr_accessor :api_url
    self.api_url = 'http://bbs.yundianjia.net/api'

    mattr_accessor :user_name
    mattr_accessor :password
    mattr_accessor :logger
    self.logger = Logger.new(STDOUT)
  end
end
