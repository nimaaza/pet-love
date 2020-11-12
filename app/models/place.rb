class Place < ApplicationRecord
  validates :full_address, :capacity, :description, presence: true
  validates :photo_url, :title, :price, presence: true
  validates :capacity, inclusion: { in: (1..10) }
  validates :price, inclusion: { in: (0..1000) }
  validates :user, uniqueness: true

  has_many :bookings
  belongs_to :user
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_address_host,
                  against: [:full_address, :title],
                  associated_against: {
                    user: [:first_name, :last_name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
