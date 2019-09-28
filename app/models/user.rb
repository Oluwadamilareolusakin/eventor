class User < ApplicationRecord
  attr_accessor :remember_token
  attr_accessor :session_token
  attr_accessor :session_created_at
  before_save :downcase_email

  def downcase_email
    self.email.downcase
  end

  def send_login_email
    SessionsMailer.login_validation(self).deliver_now
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token)
  end

  def attempt_to_login
    self.session_token = User.generate_token
    self.session_created_at = Time.now
    update_attribute(:session_digest, User.digest(session_token))
  end

  def authenticates?(attribute, token)
    digest = send("#{attribute}_digest")
    digest == User.digest(token)
  end

  def is_valid_session_token?
    self.session_created_at < 2.hours.ago
  end

  def User.generate_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.generate_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
