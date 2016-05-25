class SessionsController < ApplicationController
  def create
    event = Event.find((env['omniauth.params'] || session['omniauth.params'])['event'].to_i)
    user = User.from_omniauth(env['omniauth.auth'], event)
    session[:user_id] = user.id

    redirect_to edit_user_path(event)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
