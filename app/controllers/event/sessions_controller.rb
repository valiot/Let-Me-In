class Event::SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(user_params)
    if Attendee.create(user: user, event: current_event)
      flash[:notice] = 'Tu registro ha quedado guardado.'
    else
      render event_register_path
    end
    redirect_to event_register_path
  end

  def new
    # session[:user] = nil
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
