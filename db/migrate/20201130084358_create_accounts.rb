class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.references :account_category, :null => false
      t.references :user, :null => true
      t.references :receipt, :null => true
      t.string :title,:null=>false
      t.date :transaction_date, :null => false
      t.integer :origin_price, :null => false, :default => 0
      t.integer :discount_price, :null => false, :default => 0
      t.integer :payment, :null => false, :default => 0
      t.boolean :enable, :null => false, :default => true
      t.timestamps null: false
    end
  end
end
