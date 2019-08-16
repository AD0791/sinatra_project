class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer  :client_id
      t.string :bed_size
      t.integer :occupancy
      t.date :date
      t.string :note
      t.integer :number_of_day
    
      t.timestamps
    end
    
  end
end
