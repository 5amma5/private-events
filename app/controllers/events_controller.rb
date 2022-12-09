class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build
  end

  def show
    @attendance = EventAttendance.new
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:notice] = "Event created!"
      redirect_to @event
    else
      render :new, :unprocessable_entity
    end
  end
  
  private

  def event_params
    params.require(:event).permit(:location, :date)
  end
end
