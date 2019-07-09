require 'rails_helper'

describe '投稿記事管理', type: :feature do
  let(:user) { create(:user, email: 'test@example.com', name: 'test_user') }
  before do
    user.password = "password"
    user.save
    visit new_user_session_path
    fill_in 'メールアドレス', with: "test@example.com"
    fill_in 'パスワード', with: "password"
    click_button "ログイン"
    visit root_path
    expect(current_path).to eq root_path
    fill_in 'item_content', with: 'テスト文'
    attach_file "item_picture", "#{Rails.root}/spec/fixtures/test.jpg"
    click_button "投稿する"
  end

  context "いいねの編集" do
    it 'いいねを押すと表示が変わる' do
      visit item_path(1)
      click_button 'いいね'
    end

    it 'いいねを取り消すと表示が戻る' do
      visit item_path(1)
      click_button 'いいね'
      click_button 'いいねを取り消す'
    end
  end
end