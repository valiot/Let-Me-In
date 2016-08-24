class Event::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    @user = User.create(user_params) if @user.nil?
    @attendee = Attendee.new(user: @user, event: current_event)
    if @attendee.save
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.html{ redirect_to event_register_path, alert: 'Correo ya registrado para este evento, trata con otro.' }
      end
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
    params.permit(:name, :email, :company)
  end
end
