class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,   only: :destroy

  def index
    @items = Item.all.order('created_at DESC')
    @items = Item.page(params[:page]).per(6)
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:notice] = "投稿が作成されました!"
      redirect_to root_url
    else
      @feed_items = []
      flash[:alert] = "投稿ができませんでした。"
      render "pages/home"
    end
  end

  def destroy
    @item.destroy
    flash[:notice] = "投稿が削除されました"
    redirect_to request.referrer || user_path
  end

  private

  def item_params
    params.require(:item).permit(:content,:picture)
  end

  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    redirect_to root_url if @item.nil?
  end
end
