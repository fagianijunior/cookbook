module UsersHelper
  #size: xs (40x40), sm(90x90) md(200x200), lg()
  def display_avatar(user, version_name=nil)
    unless user.avatar.nil?
      case version_name
        when "xs" then user.avatar.xs
        when "sm" then user.avatar.sm
        when "md" then user.avatar.md
        when "lg" then user.avatar.lg
        else user.avatar
      end
    else
      case version_name
        when "xs" then "xs_avatar.jpg"
        when "sm" then "sm_avatar.jpg"
        when "md" then "md_avatar.jpg"
        when "lg" then "lg_avatar.jpg"
        else "avatar.jpg"
      end
    end
  end
end
