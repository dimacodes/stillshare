class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to image_path(comment.image), notice: "Your comment has been added."
    end
  end

  def show
    @image = Image.find_by(id: params[:image_id])
    @comment = Comment.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @image = Image.find_by(id: params[:id])
    @comment = Comment.find_by(id: params[:id])
		@comment.destroy
		redirect_to image_path(@comment.image), notice: "Your comment has been deleted."
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image_id, :user_id)
  end
end
