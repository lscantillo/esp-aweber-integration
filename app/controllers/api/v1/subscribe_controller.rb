class Api::V1::SubscribeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new_lead
    render :json => status: 500
  end
end
