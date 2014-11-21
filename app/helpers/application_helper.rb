module ApplicationHelper
  def display_small_avatar(user, css_class="")
    unless user.avatar.nil?
      image_tag(user.avatar.small, class: css_class)
    else
      image_tag("avatar.jpg", class: css_class)
     end
  end
end