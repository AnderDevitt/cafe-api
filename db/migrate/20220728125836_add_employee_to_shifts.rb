class AddEmployeeToShifts < ActiveRecord::Migration[6.1]
  def change
    add_reference :shifts, :employee, null: false, foreign_key: true
  end
end
