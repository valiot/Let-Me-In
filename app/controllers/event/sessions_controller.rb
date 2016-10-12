class Event::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    @user = User.create(user_params) if @user.nil?
    @attendee = Attendee.new(user: @user, event: current_event)
    # TODO Fix this hack
    unless dynamic_field_params.blank?
      dynamic_field_params['value_attributes'].each do |k, v|
        @dynamic_field = DynamicField.create(event_id: dynamic_field_params[:event_id], custom_field_id: k,
                                             value: v['value'], user_id: @user.id)
      end
    end
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
    # params.require(:dynamic_field).permit(:event_id, value_attributes: [:value])
  end
end
