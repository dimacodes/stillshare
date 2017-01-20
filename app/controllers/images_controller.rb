class ImagesController < ApplicationController

  def new
  end

  def create
  end

  def show
    @image = Image.find_by(id: params[:id])
  end
end
