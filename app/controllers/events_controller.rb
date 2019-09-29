class EventsController < ApplicationController
  before_action :set_event, only: %i[show update edit destroy]
  before_action :log_in_user, only: %i[new create edit update destroy]
  
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user  
    @event = @user.events.build(event_params)
    if @event.save
      flash[:success] = "#{@event.title} was successfully created! Start inviting people."
      redirect_to @event
    else
      render :new
    end
  end

  def edit
  end

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
      params.require(:event).permit(:title, :description, :date, :time)
    end

    def set_event
      @event = Event.find(params[:id])
    end
end
