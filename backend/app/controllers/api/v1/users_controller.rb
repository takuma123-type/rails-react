class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!

  def currentuser
    @user = current_api_v1_user
    render json: { status: 'success', message: 'Loaded the user', data:@user }
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end