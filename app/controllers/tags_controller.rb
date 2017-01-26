class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    tag = Tag.new(tag_params)
    image = Image.find_by(id: params[:tag][:image_id])
    if tag.save
    image_tag = ImageTag.create(tag: tag, image: image)
      redirect_to tags_path
    end
  end

  def show
    @tag = Tag.find_by(id: params[:id])
    # @image = Image.find_by(id: params[:id])
    # @images = @event.images
    @images = @tag.images

  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def tag_params
    # byebug
    params.require(:tag).permit(:content)

  end
end
