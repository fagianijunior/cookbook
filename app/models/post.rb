class Post < ActiveRecord::Base
  belongs_to :type_post
  belongs_to :user
end
