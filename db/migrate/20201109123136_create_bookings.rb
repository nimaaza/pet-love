class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :booking_start_date
      t.date :booking_end_date
      t.boolean :confirmed
      t.string :pet_description
      t.string :species
      t.references :place, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
