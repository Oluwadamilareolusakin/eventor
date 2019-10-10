# frozen_string_literal: true

class Event < ApplicationRecord
  scope :upcoming, -> { where('date > ?', Date.today) }
  scope :past, -> { where('date < ?', Date.today) }

  validates :title, presence: true
  validates :description, presence: true
  validates :time, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :cover_image, presence: true

  belongs_to :planner, class_name: 'User', foreign_key: 'user_id'
  has_many :attendances
  has_many :attendees, through: :attendances
  has_one_attached :cover_image
end
