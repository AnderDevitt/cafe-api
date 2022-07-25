class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.date :date
      t.time :start
      t.time :finish
      t.integer :hours

      t.timestamps
    end
  end
end
