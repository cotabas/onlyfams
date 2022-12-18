module ApplicationHelper

  def avatar_tag(user_id, *other_args)
    user = User.find(user_id)

    if user.avatar.attached?
      image_tag user.avatar, other_args[0]
    else
      image_tag 'profile_placeholder.png', other_args[0]
    end
  end
end
