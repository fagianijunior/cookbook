class Post < ActiveRecord::Base
  belongs_to :type_post
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true
  validates :type_post, presence: true
  
  before_save { self.content = content_to_html(self.content, self.type_post.id) }
  
  def content_to_html(content, type_post)
    case type_post
      when 1
        content.gsub("\r\n","<br/>")
      when 2
        content
    end
  end
end