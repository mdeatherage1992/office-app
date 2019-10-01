class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.time :start
      t.time :finish
      t.integer :break_length
      t.timestamps
    end
  end
end
