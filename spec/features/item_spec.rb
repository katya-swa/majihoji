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
  end

  context "投稿の編集" do
    it '投稿を作成できる' do
      fill_in 'item_content', with: 'テスト文'
      attach_file "item_picture", "#{Rails.root}/spec/fixtures/test.jpg"
      click_button "投稿する"
      expect(page).to have_content "テスト文"
    end

    it '投稿を削除できる' do
      fill_in 'item_content', with: 'テスト文'
      attach_file "item_picture", "#{Rails.root}/spec/fixtures/test.jpg"
      click_button "投稿する"
      visit items_path
      click_link "削除"
      expect(page).not_to have_content "テスト文"
    end
  end
end