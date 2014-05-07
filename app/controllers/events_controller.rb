class EventsController < ApplicationController

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/1
  def show
    @event = Event.find(params[:id])
    @new_comment = @event.comments.build
  end

  # GET /events/new
  def new
    @new_event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  def create
    @new_event = Event.new(event_params)
    if @new_event.save
      redirect_to events_path 
    else
      redirect_to new_event_path
    end
  end

  # PATCH/PUT /events/1
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to event_path(@event)
    end 
  end

  # DELETE /events/1
  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to events_path
    else
      redirect_to event_path(@event)
    end
  end

  def filter
    @events = Event.search(params[:filter])
  end

  def search
    @events = Event.search(params[:search])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit!
  end

end
