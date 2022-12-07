class EventAttendanceController < ApplicationController
  # before_action :authenticate_user!

  # def create
  #   @event_attendance = EventAttendance.new
  #   @event_attendance.event_attendee_id = params[:event_attendance][:event_attendee_id]
  #   @event_attendance.attended_event_id = params[:event_attendance][attended_event_id]
  # end

  # if @event_attendance.save
  #   redirect_to @event_attendance.attended_event, notice: "You have joined the event."
  # else
  #   redirect_to @event_attendance.attended_event, status: :unprocessable_entity
  # end
end