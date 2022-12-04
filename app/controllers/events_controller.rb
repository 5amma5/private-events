class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:success] = "Event created!"
      redirect_to @event
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end
  
  private
    def event_params
      params.require(:event).permit(:location, :date)
    end
  
end
