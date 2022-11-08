class AddPaxToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :pax, :integer
  end
end
