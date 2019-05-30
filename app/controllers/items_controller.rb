class ItemsController < ApplicationController
  before_action :correct_item, only: :destroy
  before_action :set_item, only: %i(show edit update)
  before_action :authenticate_user!, only: %i(index edit update create destroy)

  def index
    @search = Item.ransack(params[:q])
    @result = @search.result.page(params[:page]).per(6)
  end

  def show
    @comment = Comment.new
    @comments = @item.comments
  end

  def edit
  end

  def update
    @item.update!(item_params)
    redirect_to item_path(@item), notice: "投稿を更新しました。"
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

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:content, :picture, :tag_list)
  end

  def correct_item
    @item = current_user.items.find_by(id: params[:id])
    redirect_to root_url if @item.nil?
  end
end
