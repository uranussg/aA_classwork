# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :user_name, :password_digest, :session_token, presence: true
  validates :user_name, :session_token, uniqueness: true


  after_initialize :ensure_session_token

  has_many :cats
  #everything else defaulted

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.update!(session_token: SecureRandom.urlsafe_base64(16))
    self.session_token
  end

  def password=(password)
    #db turns it into a string
    self.password_digest = BCrypt::Password.create(password)
    # self.password_digest = password
    @password = password
  end

  def is_password?(password)
    #changing class from string into password
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end 

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    user && user.is_password?(password) ? user : nil
  end 




end
