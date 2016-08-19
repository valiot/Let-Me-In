class Event::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    @user = User.create(user_params) if @user.nil?
    # if Attendee.find_by('created_at >= ? AND created_at <= ?', Time.zone.today.beginning_of_day, Time.zone.today.end_of_day)
    #   respond_to do |format|
    #     format.html{ redirect_to event_register_path, alert: 'Correo ya registrado para este evento, trata con otro.' }
    #   end
    # elsif Attendee.create(user: @user, event: current_event)
    if Attendee.create(user: @user, event: current_event)
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
