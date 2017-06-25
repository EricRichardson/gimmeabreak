class NotificationsController < ApplicationController

  def index
    @notifications = Notification.all
    if @notifications.save
      render json: @notifications
    else
      error = {error: 'Could not create user'}
      render json: error
    end
  end

end
