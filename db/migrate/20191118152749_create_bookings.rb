class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :number_of_guests
      t.integer :value_of_booking
      t.references :yacht, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
