class User < ApplicationRecord

  validates :username, :password_digest, :session_token, presence: true
  validates :username, uniqueness: true 
  validates :password, length: {minimum: 6, allow_nil: true} 


  attr_reader :password 

  after_initialize :ensure_session_token

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token 
    self.session_token ||= SecureRandom.base64
  end

  def reset_session_token!
    self.update(session_token:SecureRandom.base64)
    self.session_token
  end

  def self.find_by_credentials(username, password)
    user = self.find_by(username: username)
    user && user.is_password?(password) ? user : nil
  end


  has_many :subs
  has_many :posts
  has_many :comments 

end
