class RemoveFieldNameFromShifts < ActiveRecord::Migration[6.1]
  def change
    remove_column :shifts, :hours, :integer
  end
end
