class Tool < ApplicationRecord
  CATEGORIES = %w(Home\ Improvement Automotive Gardening)
  belongs_to :user
  has_many :bookings

  validates :user_id, presence: true
  validates :name, presence: true
  validates :category, presence: true
  validates :location, presence: true
end
