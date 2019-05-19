class  UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.page(params[:page]).per(16)
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items.page(params[:page]).per(6)
  end
end
