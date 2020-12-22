class CreateTrailTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trail_trips do |t|
      t.integer :trail_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
