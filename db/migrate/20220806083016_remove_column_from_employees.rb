class RemoveColumnFromEmployees < ActiveRecord::Migration[6.1]
  def change
    remove_column :employees, :email, :string
  end
end
