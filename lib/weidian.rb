require "weidian/version"
require 'eat'
require 'json'

module Weidian
  API_ENDPOINT = "https://api.vdian.com/"
  HOWTO_CONFIG = <<-EOF
    Configure #{self.name} fist like this:

  #{self.name}.config do
      @app_key = '1111111'             # your app_key
      @app_secret = '1111111111111111' # your secret
    end

    or:

  #{self.name}.app_key = '111111'          # your app_key
  #{self.name}.app_secret = '1111111111'   # your secret
  EOF

  class << self
    alias_method :config, :instance_eval
    attr_accessor :app_key, :app_secret

    def access_token
      (@access_token and !access_token_expired?) ? @access_token : get_access_token_from_api
    end

    private
    def get_access_token_from_api
      raise HOWTO_CONFIG unless @app_key or @app_secret

      url = API_ENDPOINT + "token?grant_type=client_credential" + "&appkey=#{@app_key}" + "&secret=#{@app_secret}"
      result = JSON.parse(eat url, :openssl_verify_mode => 'none').fetch('result', {})
      @expire_date = Time.now + result['expire_in'] - 120
      @access_token = result['access_token']

      raise "Get access_token Error:" + "url: #{url}" + result.to_s unless @access_token
    end

    def access_token_expired?
      return false unless defined?(@expire_date)
      Time.now > @expire_date
    end

  end
end
