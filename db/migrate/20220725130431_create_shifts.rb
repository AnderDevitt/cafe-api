class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.string :date
      t.string :start
      t.string :finish
      t.integer :hours

      t.timestamps
    end
  end
end
