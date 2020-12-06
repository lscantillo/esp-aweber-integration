# frozen_string_literal: true

module AweberService
  class AddSubscriber
    require 'uri'
    require 'json'
    require 'http'

    def initialize(data)
      set_params
      @data = data   
    end

    def call
      #validar token existente activo
      token = AweberService::GetAccessToken.new().call
      @authorization = "Bearer #{token}"
      uri = URI( @uri + '/1.0/accounts/1663494/lists/5873413/subscribers')
      body = json_data(@data['email'],@data['name'],@data['phone'],@data['receive_mail'])
      response = HTTP.headers(:accept => "application/json", "Content-Type" => "application/json", :Authorization => @authorization).post(uri,:json=> body)

    end  

    private

    def set_params
      @uri = ENV['URI_API']
      @client_id = ENV['CLIENT_ID']
      @client_secret = ENV['CLIENT_SECRET']
    end

    def json_data(email,name,phone,receive_mail,send_info)
      
      data_user =  {
              "email" => email,
              "name" => name,
              "custom_fields" => {
                  "Telefono" => phone,
                  "Deseas recibir correos de nosotros" => receive_mail,
                  "send-information-status" => 'opted-in',
              },
              "update_existing": "true"
          }
      data_user
    end
    
  end
end