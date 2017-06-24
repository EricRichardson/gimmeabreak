class UsersController < ApplicationController
  
  def create
    @user = User.new user_params
    if @user.save
      render json: @user
    else
      error = {error: 'Could not create user'}
      render json: error
    end
  end

  def show
    @user = User.find params[:id]
    respond_to do |format|
      format.json { render json: @user }
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
