class AddGuestToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :guest, :integer
  end
end
