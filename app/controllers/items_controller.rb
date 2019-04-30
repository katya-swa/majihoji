class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_item, only: :destroy

  def index
    @items = Item.all.order(created_at: :desc)
    @items = Item.page(params[:page]).per(6)
    @search = Item.ransack(params[:q])
    @result = @search.result.page(params[:page]).per(6)
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update!(item_params)
    redirect_to items_url, notice: "投稿を更新しました。"
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
    if @item.user == current_user
      flash[:notice] = "投稿が削除されました" if @item.destroy
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
    redirect_to request.referrer || user_path
  end


private

  def item_params
    params.require(:item).permit(:content,:picture)
  end

  def correct_item
    @item = current_user.items.find_by(id: params[:id])
    redirect_to root_url if @item.nil?
  end
end
