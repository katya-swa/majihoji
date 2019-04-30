class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
    @users = User.page(params[:page]).per(12)
    @search = User.ransack(params[:q])
    @result = @search.result.page(params[:page]).per(24)
  end

  def show
    @user = User.find_by(id: params[:id])
    @items = @user.items.page(params[:page]).per(12)
  end

end
