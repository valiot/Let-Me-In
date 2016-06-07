class UsersController < ApplicationController
  def edit
    @user = current_user
    @event = Event.find(params[:event])
  end

  def update
    if current_user.update(user_params)
      redirect_to event_checkin_path(current_user.events.last), notice: 'Gracias por registrarte.'
      session[:user_id] = nil
    else
      render :edit, notice: 'No se pudieron actualizar tus datos'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :shirt_size)
  end
end
