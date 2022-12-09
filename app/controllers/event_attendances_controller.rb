class EventAttendancesController < ApplicationController
  before_action :authenticate_user!
  def create
    @attendance = current_user.event_attendances.build(event_attendance_params)
    
    if @attendance.save
      flash.notice = "See you there!"
      redirect_back_or_to(Event.find(@attendance.attended_event_id))
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @attendance = EventAttendance.find_by(event_attendee_id: current_user.id, attended_event_id: params[:id])
    @attendance.destroy

    redirect_to event_path, alert: "You are no longer attending the event."
  end
  

  private

  def event_attendance_params
    params.require(:event_attendance).permit(:event_attendee_id, :attended_event_id)
  end
end