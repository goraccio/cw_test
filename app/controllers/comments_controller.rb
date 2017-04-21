class CommentsController < ApplicationController
  def new
    Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.json { head :no_content, status: :created }
      else
        format.json do
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user, :content)
  end
end
