class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :order, null: false
      t.datetime :start_datetime, null: false
      t.datetime :end_datetime, null: false
      t.time  :progress_time
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end
  end
end
