class User < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader

  belongs_to :gender

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }
  
  validates :first_name, :email, :birth, :gender, presence: true

  validates :email, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  #validates :password, length: { minimum: 6 }
  
  has_secure_password
end