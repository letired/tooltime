class Tool < ApplicationRecord
  CATEGORIES = %w(Home\ Improvement Automotive Gardening)
  belongs_to :user
  has_many :bookings
  has_attachment :photo
  # belongs_to :owner, class_name: "User", foreign_key: :user_id
end
