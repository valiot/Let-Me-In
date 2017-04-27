class EventsController < ApplicationController
  def show
    render json: Event.find(params[:id].to_i)
  end
end
