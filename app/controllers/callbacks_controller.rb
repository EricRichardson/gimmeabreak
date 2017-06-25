class CallbacksController < ApplicationController
  def microsoft

      user = User.find_or_create_from_microsoft request.env['omniauth.auth']
      session[:user_id] = user.id
      redirect_to root_path, notice: "Signed in with microsoft!"

  end

end
