class RemovePhotoUrlFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :pet_photo_url
  end
end
