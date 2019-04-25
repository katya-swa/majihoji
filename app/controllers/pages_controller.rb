class PagesController < ApplicationController
  def home
    if user_signed_in?
      @item  = current_user.items.build
      @items = Item.all.order('created_at DESC')
      @feed_items = current_user.feed.page(params[:page]).per(12)
    end
  end

  def about
  end
end
