class EventsController < ApplicationController
  def index
    @events = Event.all params[ :sport_id ]
  end

  def show
    @event = Event.find params[ :id ], params[ :sport_id ]
  end
end