class Place < ApplicationRecord
  validates :full_address, :capacity, :description, :photo_url, presence: true
  validates :capacity, inclusion: { in: (1..10) }

  belongs_to :user
  has_many :bookings
end
