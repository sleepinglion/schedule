class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :address_category, null: false
      t.string  :title
      t.integer :users_count, :null => false, :default=>0
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end
  end
end
