class User < ApplicationRecord
  validates :email, :password, :first_name, :last_name, presence: true

  has_many :bookings
  has_one :place
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
