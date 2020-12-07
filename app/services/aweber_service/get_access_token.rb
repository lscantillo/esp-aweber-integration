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
      uri = URI(@uri + '/oauth2/token')
      body = { :client_id => @client_id, :client_secret => @client_secret, :grant_type => @grant_type, :refresh_token => @refresh_token}
      response = HTTP.headers(:accept => "application/json", :Authorization => @authorization).post(uri,:json=> body)
      resp = response.body
      resp = JSON.parse(resp)
      token = resp['access_token']
      expiry = resp['expires_in']
      AweberService::SaveAccessToken.new(token, expiry).call
      token
    end

    private

    def set_params
      @uri = ENV['URI_AUTH']
      @client_id = ENV['CLIENT_ID']
      @client_secret = ENV['CLIENT_SECRET']
      @grant_type = ENV['GRANT_TYPE']
      @refresh_token = ENV['REFRESH_TOKEN']
      @authorization = ENV['AUTHORIZACION_AUTH']
    end
  end
end
