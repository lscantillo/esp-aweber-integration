class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
  end

  def new
    @user = User.new
  end

  def show
  end

  def create

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :phone, :receive_mail, :send_information_status)
  end
end
