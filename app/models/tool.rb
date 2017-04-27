class Tool < ApplicationRecord
  CATEGORIES = %w(Home\ Improvement Automotive Gardening)
  CITIES = %w(Berlin Paris London)
  # gecode specific settings
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
  # db relations
  belongs_to :user
  has_many :bookings, dependent: :destroy
  # validations
  validates :user_id, presence: true
  validates :name, presence: true
  validates :city, presence: true
  validates :category, presence: true
  validates :location, presence: true
  has_attachment :photo
  # belongs_to :owner, class_name: "User", foreign_key: :user_id
end
