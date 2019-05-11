class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      render :index
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    if @comment.destroy
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end