class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :username
      t.string :email
      t.string :is_admin
      t.string :password_digest

      t.timestamps
    end
  end
end
