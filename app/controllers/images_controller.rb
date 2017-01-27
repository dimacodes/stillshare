class ImagesController < ApplicationController

  def index
  end

  def new
    # @event = Event.find_by(params[:id])
    @image = Image.new(event_id: params[:event_id])
  end

# add current_user later
  def create
    # @image = current_user.events.images.create(image_params)
    # @event = Event.find_by(params[:event_id])
    @image = Image.new(image_params)
    # byebug
    if @image.save
      redirect_to event_path(@image.event), notice: "#{@image.title} has been added."
    else
      render :new
    end
  end

  def show
    @event = Event.find_by(id: params[:event_id])
    @image = Image.find_by(id: params[:id])
    @comment = Comment.new
  end

  def edit
    @image = Image.find_by(id: params[:id])
  end

  def update
    @image = Image.find_by(id: params[:id])
    if @image.update(image_params)
      redirect_to event_image_path(@image), notice: "#{@image.title} has been updated."
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @image = Image.find_by(id: params[:id])
		@image.destroy
		redirect_to event_path(@image.event), notice: "#{@image.title} has been deleted."
  end

  private

  def image_params
    params.require(:image).permit(:title, :date, :description, :image, :event_id)
  end
end
