class Event::AttendeesController < ApplicationController
  def new
  end

  def create
    if Attendee.create(user: current_user, event: current_event)
      session[:user_id] = nil
      flash[:notice] = 'Tu check-in ha quedado registrado.'
      else
      render event_checkin_path
    end
  end
end
