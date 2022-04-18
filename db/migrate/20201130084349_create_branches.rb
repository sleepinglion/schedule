class CreateBranches< ActiveRecord::Migration[6.0]
  def change
    create_table :branches do |t|
      t.string :title,  null: false
      t.string :description
      t.integer :orders_count, null: false, default: 0
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end
  end
end
