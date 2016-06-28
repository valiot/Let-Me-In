class Event::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    @user = User.create(user_params) if @user.nil?
    if Attendee.create(user: @user, event: current_event)
      flash[:notice] = 'Tu registro ha quedado guardado.'
      respond_to do |format|
        format.js
      end
    else
      render event_register_path
    end
  end

  def new
  end

  def destroy
    session[:user] = nil
    redirect_to event_main_path
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
