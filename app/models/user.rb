class User < ApplicationRecord
  validates :email, :password, :first_name, :last_name, presence: true

  has_many :bookings, dependent: :destroy
  belongs_to :place, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
