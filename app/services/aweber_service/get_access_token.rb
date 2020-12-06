# frozen_string_literal: true

module AweberService
  class GetAccessToken
    require 'uri'
    require 'json'
    require 'http'

    def initialize
      set_params
    end

    def call
      uri = URI( @uri + '/oauth2/token')
      body = { :client_id => @client_id, :client_secret => @client_secret, :grant_type => @grant_type, :refresh_token => @refresh_token}
      response = HTTP.headers(:accept => "application/json", :Authorization => @authorization).post(uri,:json=> body)
      resp = response.body
      resp = JSON.parse(resp)
      token = resp['access_token']
      expiry = resp['expires_in']
      #hacer job para eso
      AweberService::SaveAccessToken.new(token,expiry).call
      token
    end

    private

    def set_params
      @uri = 'https://auth.aweber.com'
      @client_id = 'TO8sYTwXOeVK964wtbRPNnAxOlfiLxWs'
      @client_secret = 'sxF5SBmgFABUGTbMkLCEcnnX3xwe1OgU'
      @grant_type = 'refresh_token'
      @refresh_token = 'RKqFc99WgHXlSGNBFYmWV6uj53q3FuDz'
      @authorization = 'Basic VE84c1lUd1hPZVZLOTY0d3RiUlBObkF4T2xmaUx4V3M6c3hGNVNCbWdGQUJVR1RiTWtMQ0Vjbm5YM3h3ZTFPZ1U='
    end
    
  end
end