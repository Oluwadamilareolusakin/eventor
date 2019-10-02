# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_token
  attr_accessor :session_token
  has_many :events, dependent: :destroy
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attendings, through: :attendances, source: :event
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true
  before_save :downcase_email

  def downcase_email
    email.downcase
  end

  def send_login_email
    SessionsMailer.login_validation(self).deliver_now
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token)
  end

  def attempt_to_login
    self.session_token = User.generate_token
    update_attribute(:session_created_at, Time.zone.now)
    update_attribute(:session_digest, User.digest(session_token))
  end

  def authenticates?(attribute, token)
    digest = send("#{attribute}_digest")
    digest == User.digest(token)
  end

  def is_valid_session?
    session_created_at > 2.hours.ago
  end

  def self.generate_token
    SecureRandom.urlsafe_base64
  end

  def attend(event)
    attendings << event
  end

  def unattend(event)
    attendings.delete(event)
  end

  def is_attending?(event)
    attendings.include?(event)
  end

  def is_planner?(event)
    events.include?(event)
  end

  def remember
    self.remember_token = User.generate_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
