class PagesController < ApplicationController
  def home
    if user_signed_in?
      @item  = current_user.items.build
    end
  end

  def about
  end
end
