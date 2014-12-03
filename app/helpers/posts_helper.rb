module PostsHelper
  def post_date(date)
    date.strftime("postado em %d %m %Y - %H:%M")
end
end
