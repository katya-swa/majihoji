require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = @user.items.new
  end

  it "写真がなければ投稿無効" do
    @item = @user.items.new(content: "紹介文", tag_list: "テスト")
    expect(@item).not_to be_valid
  end

  it "紹介文がなければ投稿無効。" do
    @item.content = ""
    expect(@item).not_to be_valid
  end

  it "外部キーがなければ投稿無効" do
    @item = Item.new(user_id: nil)
    expect(@item).not_to be_valid
  end

  it "タグをつけなくても投稿可能" do
    picture_path = File.join(Rails.root, 'spec/fixtures/test.jpg')
    @item = @user.items.new(content: "紹介文", picture: File.open(picture_path))
    expect(@item).to be_valid
  end
end
