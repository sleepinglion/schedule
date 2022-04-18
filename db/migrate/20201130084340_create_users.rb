class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name,  null: false
      t.string :phone, limit: 60
      t.string :email, limit: 100
      t.string :address
      t.integer :orders_count, null: false, default: 0
      t.integer :accounts_count, null: false, default: 0
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end
  end
end
