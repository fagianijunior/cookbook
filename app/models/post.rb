class Post < ActiveRecord::Base
  belongs_to :type_post
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :type_post, presence: true
end
