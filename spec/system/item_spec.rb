require 'rails_helper'

describe '投稿記事管理機能', type: :system do
  let(:user) { create(:user, email: 'test@example.com', name: 'test_user') }
  before do
    user.password = "password"
    user.save
    visit new_user_session_path
  end

  it 'ログインテスト' do
    fill_in 'メールアドレス', with: "test@example.com"
    fill_in 'パスワード', with: "password"
    click_button "ログイン"
    visit root_path
    expect(current_path).to eq root_path
  end
end