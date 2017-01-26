class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to image_path(comment.image)
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image_id)
  end
end
