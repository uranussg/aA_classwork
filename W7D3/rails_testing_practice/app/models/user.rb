

class User < ApplicationRecord 
  validates :username, :session_token, :password_digest, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  after_initialize :ensure_session_token
  attr_reader :password

  has_many :comments,
    foreign_key: :author_id

  has_many :goals,
    foreign_key: :author_id

  has_many :comments_received,
    through: :goals,
    source: :comments

  has_many :goals_commented_on,
    through: :comments,
    source: :goal
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.update!(session_token: SecureRandom.urlsafe_base64(16))
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user && user.is_password?(password) ? user : nil
  end

end
