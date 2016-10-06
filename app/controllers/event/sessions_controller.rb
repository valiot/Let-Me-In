class Event::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    @user = User.create(user_params) if @user.nil?
    @attendee = Attendee.new(user: @user, event: current_event)
    @dynamic_field = DynamicField.new(dynamic_field_params)
    @dynamic_field.user_id = @user.id
    @dynamic_field.save
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
    @event = Event.find_by(slug: params[:event])
    @dynamic_field = DynamicField.new
  end

  def destroy
    session[:user] = nil
    redirect_to event_main_path
  end

  private

  def user_params
    params.permit(:name, :email, :company)
  end

  def dynamic_field_params
    params.require(:dynamic_field).permit(:value, :custom_field_id, :event_id)
  end
end
