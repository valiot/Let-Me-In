class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(params[:email])
    session[:user_id] = user.id
    redirect_to edit_user_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
