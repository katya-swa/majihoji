module ApplicationHelper
  module UserHelper
    def avatar_for(user)
      if user.avatar
        image_tag "/uploads/user/#{user.avatar}"
      else
        image_tag "/images/no_avatar.jpg"
      end
    end
  end

  # デバイスのエラーメッセージ出力メソッド
  def devise_error_messages
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="error_field alert alert-danger" role="alert">
          <p class="error_msg">#{msg}</p>
        </div>
      EOF
    end
    html.html_safe
  end
end