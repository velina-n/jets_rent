class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :airport
      t.date :start_date
      t.date :end_date
      t.string :status, default: 'pending'
      t.text :special_requests
      t.references :jet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
