# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show update edit destroy]
  before_action :log_in_user, only: %i[new create edit update destroy index]
  before_action :admin?, only: %i[index]

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @attendees = @event.attendees
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "#{@event.title} was successfully created! Start inviting people."
      redirect_to @event
    else
      render :new
    end
  end

  def edit; end

  def update
    @event.update(event_params)
    if @event.save
      flash[:success] = "#{@event.title} was successfully updated!"
      redirect_to @event
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :time, :location, :cover_image)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
