class Tool < ApplicationRecord
  CATEGORIES = %w(Home\ Improvement Automotive Gardening)
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true
  validates :category, presence: true
  validates :location, presence: true
  has_attachment :photo
  # belongs_to :owner, class_name: "User", foreign_key: :user_id
end
