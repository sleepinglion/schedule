class CreateReservationAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :reservation_admins do |t|
      t.references :reservation, null: false
      t.references :admin, null: false
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end
  end
end
