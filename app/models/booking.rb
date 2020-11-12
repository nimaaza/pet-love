class Booking < ApplicationRecord
  validates :booking_start_date, :booking_end_date, presence: true
  validates :pet_description, :species, presence: true

  belongs_to :place
  belongs_to :user

  has_one_attached :pet_photo
end
