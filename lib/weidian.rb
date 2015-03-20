require "weidian/version"
require 'eat'
require 'json'

module Weidian
  API = { endpoint: 'https://api.vdian.com',
          version: '1.0',
          format: 'json' }

  HOWTO_CONFIG = <<-EOF
  #{self.name}.config do
    @app_key = '1111111'                    # your app_key
    @app_secret = '1111111111111111'        # your app_secret
  end

  or:

  #{self.name}.app_key = '111111'           # your app_key
  #{self.name}.app_secret = '1111111111'    # your app_secret
  EOF


  class << self

    alias_method :config, :instance_eval
    attr_accessor :app_key, :app_secret

    def access_token
      (@access_token && !access_token_expired?) ? @access_token : get_access_token_from_api
    end


    private

    def method_missing(method, **param)
      public = { method: method.to_s.gsub('_', '.'),
                 access_token: access_token,
                 version: API[:version],
                 format: API[:json] }

      url = API[:endpoint] + "/api?" + URI.encode_www_form(param: param.to_json, public: public.to_json)

      JSON.parse(eat url, :openssl_verify_mode => 'none')
    end

    def get_access_token_from_api
      raise HOWTO_CONFIG unless @app_key or @app_secret

      url = API[:endpoint] + "/token?" + URI.encode_www_form(grant_type: "client_credential", 
                                                             appkey: @app_key,
                                                             secret: @app_secret)

      result = JSON.parse(eat url, :openssl_verify_mode => 'none').fetch('result', {})

      @expire_date = Time.now + result['expire_in'] - 120
      @access_token = result['access_token']

      @access_token ? @access_token : raise("Get access_token Error:" + "url: #{url}" + result.to_s)
    end

    def access_token_expired?
      return true unless defined?(@expire_date)
      Time.now > @expire_date
    end

  end
end
