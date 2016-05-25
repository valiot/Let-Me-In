class EventsController < ApplicationController
  def index
    @events = Event.where('starts_at >= ? and finishes_at <= ?', Time.zone.now, Time.zone.now)
  end

  def checkin
    @event = Event.find(params[:event])
  end
end
