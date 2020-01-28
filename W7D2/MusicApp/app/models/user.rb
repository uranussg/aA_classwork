class User < ApplicationRecord
    after_initialize :ensure_session_token

    def generate_session_token
        SecureRandom.safeurl_base64
    end

    def ensure_session_token
        self.session_tokeng ||= generate_session_token
    end

    def reset_session_token
        self.update(session_token: generate_session_token)
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(emal: email)
        user && user.is_password?(password) ? user : nil 
    end
end
