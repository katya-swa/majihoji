class PagesController < ApplicationController
  def home
    if user_signed_in?
      @item  = current_user.items.build
      @feed_items = current_user.items.page(params[:page]).per(6)
    end
  end

  def about
  end
end
