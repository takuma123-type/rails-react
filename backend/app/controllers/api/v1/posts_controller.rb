class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user!

  def index
    @posts = current_user.Post.all
    @post = current_user.Post.new
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
  end

  def show
    @comments = @post.comments
    @comment = current_user.comments.new
    render json: { status: 'SUCCESS', message: 'Loaded the post', data: @post }
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      render json: { status: 'SUCCESS', data: post }
    else
      render json: { status: 'ERROR', data: post.errors }
    end
  end

  def update
    if @post.update(post_params)
      render json: { status: 'SUCCESS', message: 'Updated the post', data: @post }
    else
      render json: { status: 'SUCCESS', message: 'Not updated', data: @post.errors }
    end
  end

  def destroy
    @post.destroy
    render json: { status: 'SUCCESS', message: 'Deleted the post', data: @post }
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end