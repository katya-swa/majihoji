require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @comment = FactoryBot.create(:comment, user: @user, item: @item)
  end

  it 'コメントが登録できる' do
    expect(@comment).to be_valid
  end

  it 'コメントが登録できない' do
    @comment.content = ""
    expect(@comment).not_to be_valid
  end
end
