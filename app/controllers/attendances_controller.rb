class AttendancesController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    current_user.attend(event)
    redirect_to event
  end

  def destroy
    event = Event.find_by(params[:id])
    current_user.unattend(event)
    redirect_to event
  end

end