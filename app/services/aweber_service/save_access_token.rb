# frozen_string_literal: true

module AweberService
  class SaveAccessToken
    
    def initialize(access_token, expires_in)
      @access_token = access_token
      @expires_in = expires_in
    end

    def call
      token = AccessToken.create(:access_token => @access_token, :expires_in => @expires_in)
    end 
  end
end
