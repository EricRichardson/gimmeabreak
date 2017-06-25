class UsersController < ApplicationController
  
  def create
    @user = User.new user_params
    if @user.save
      render json: @user
    else
      error = {error: "Could not create user. Error: #{ @user.errors.full_messages }"}
      render json: error
    end
  end

  def show
    @user = User.find params[:id]
    render json: @user
  end

  def register_device
    @user_device = UserDevice.new()
    @user_device.user_id = params[:id]
    @user_device.device_id = params[:device_id]
    if @user_device.save
      render json: @user_device
    else
      error = { error: "Could not register user device #{ @user_device.errors.full_messages }" }
      render json: error
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
