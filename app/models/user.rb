
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
  
  def send_confirmation
    self.update_column(:password_reset_token, SecureRandom.urlsafe_base64)
    self.update_column(:password_reset_sent_at, Time.zone.now)
    UserMailer.send_confirmation_mail(self).deliver
  end
  
  def send_alteration_password
    self.update_column(:password_reset_token, SecureRandom.urlsafe_base64)
    self.update_column(:password_reset_sent_at, Time.zone.now)
    UserMailer.send_alteration_password_mail(self).deliver
  end
  
end