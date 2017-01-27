class EventsController < ApplicationController

  def index
    if params[:user_id]
      @events = Event.find(params[:user_id]).events
    else
      @events = Event.all
    end
  end

  def new
    @event = Event.new(user_id: params[:user_id])
  end

  def create
    @event = current_user.events.create(event_params)
    if @event.save
      redirect_to event_path(@event), notice: "#{@event.title} has been added."
    else
      render :new 
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    # @image = Image.find_by(id: params[:id])
    @images = @event.images
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event), notice: "#{@event.title} has been updated."
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.destroy
    redirect_to user_path(current_user), notice: "#{@event.title} has been deleted."
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :description, :user_id, :image)
  end
end
