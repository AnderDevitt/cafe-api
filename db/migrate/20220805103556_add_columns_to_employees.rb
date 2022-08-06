class AddColumnsToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :email, :string
    add_column :employees, :is_admin, :string
  end
end
