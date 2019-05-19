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
end