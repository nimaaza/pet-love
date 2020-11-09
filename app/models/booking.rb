class Booking < ApplicationRecord
  validates :booking_start_date, :booking_end_date, presence: true
  validates :confirmed, :pet_description, :species, presence: true

  belongs_to :place
  belongs_to :user
end
