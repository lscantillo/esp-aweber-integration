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
      body = json_data(@data['name'],@data['email'],@data['phone'],@data['receive_mail'],@data['send_information_status'])
      response = HTTP.headers(:accept => "application/json", :Authorization => @authorization).post(uri,:json=> {
        "email" => @data['email'],
        "name" => @data['name'],
        "custom_fields" => {
            "Telefono" => @data['phone'],
            "Deseas recibir correos de nosotros" => @data['receive_mail'],
            "send-information-status" => @data['send_information_status'],
        },
        "update_existing": "true"
      })
     
      puts "******BODY*******"
      puts body
      puts "******RESPONSE*******"
      puts response
    end  

    private

    def set_params
      @uri = 'https://auth.aweber.com'
      @client_id = 'TO8sYTwXOeVK964wtbRPNnAxOlfiLxWs'
      @client_secret = 'sxF5SBmgFABUGTbMkLCEcnnX3xwe1OgU'
      @grant_type = 'refresh_token'
      @refresh_token = 'RKqFc99WgHXlSGNBFYmWV6uj53q3FuDz'  
    end

    def json_data(email,name,phone,receive_mail,send_info)
      
      data_user =  {
              "email" => email,
              "name" => name,
              "custom_fields" => {
                  "Telefono" => phone,
                  "Deseas recibir correos de nosotros" => receive_mail,
                  "send-information-status" => send_info,
              },
              "update_existing": "true"
          }
      data_user.to_json
    end
    
  end
end