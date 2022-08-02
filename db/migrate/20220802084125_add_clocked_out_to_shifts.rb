class AddClockedOutToShifts < ActiveRecord::Migration[6.1]
  def change
    add_column :shifts, :clocked_out, :boolean
  end
end
