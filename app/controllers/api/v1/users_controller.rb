class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new_lead
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        msg = { :status => 200, :message => "Success! User has been created successfully" }
        format.json { render :json => msg }
      else
        
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:name, :email, :phone, :receive_mail, :send_information_status)
    end
end
