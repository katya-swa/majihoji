require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "名前とメールアドレスとパスワードがあれば登録できる" do
    expect(@user).to be_valid
  end

  it "名前がなければ登録できない" do
    @user.name = ""
    expect(@user).not_to be_valid
  end

  it "メールアドレスがなければ登録できない" do
    @user.email = ""
    expect(@user).not_to be_valid
  end

  it "メールアドレスが重複していたら登録できない" do
    user = FactoryBot.build(:user, email: "test@test.com")
    expect(user).not_to be_valid
  end

  it "パスワードがなければ登録できない" do
    @user.password = ""
    expect(@user).not_to be_valid
  end
end
