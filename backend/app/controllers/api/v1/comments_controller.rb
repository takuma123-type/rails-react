class Api::V1::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render json: { status: 'success', data: comment }
    else
      render json: { status: 'error', data: comment.errors }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :post_id)
  end
end