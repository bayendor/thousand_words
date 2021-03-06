class SessionsController < ApplicationController
  def new
    redirect_to '/auth/twitter'
  end

  def create
    @user = User.find_or_create_from_omniauth(auth)
    reset_session
    session[:user_id] = @user.id
    redirect_to root_path, notice: 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Signed out!'
  end

  def failure
    redirect_to root_path, alert: 'Authentication error!'
  end

  protected

  def auth
    request.env['omniauth.auth']
  end
end
