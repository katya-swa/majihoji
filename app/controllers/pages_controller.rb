class PagesController < ApplicationController
  def home
    if user_signed_in?
      @item  = current_user.items.build
      @items = Item.find(29221)
      @feed_items = current_user.feed.page(params[:page]).per(6)
    end
  end

  def about
  end
end
