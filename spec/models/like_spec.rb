require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @like = FactoryBot.create(:like, user: @user, item: @item)
  end

  it 'いいねが登録できる' do
    expect(@like).to be_valid
  end

  it 'ログインしていないといいねできない' do
    @like.user_id = ""
    expect(@like).not_to be_valid
  end

  it '投稿がないといいねできない' do
    @like.item_id = ""
    expect(@like).not_to be_valid
  end
end
