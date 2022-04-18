class CreateAddress < ActiveRecord::Migration[6.0]
  def change
    create_table :address do |t|
      t.references :address_category, null: false
      t.string  :title
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end
  end
end
