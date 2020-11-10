class AddPetPhotoUrlToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :pet_photo_url, :string
  end
end
