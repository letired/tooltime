class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :tool, foreign_key: true
      t.string :message
      t.date :date_begin
      t.date :date_end
      t.boolean :accepted, :default => nil

      t.timestamps
    end
  end
end
