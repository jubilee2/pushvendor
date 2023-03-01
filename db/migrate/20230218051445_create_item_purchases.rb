class CreateItemPurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :item_purchases do |t|
      t.references :item, null: false, foreign_key: true
      t.references :purchase, null: false, foreign_key: true
      t.integer :quantity, :default => 1
      t.decimal :price, precision: 8, scale: 2
      t.decimal :unit_price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
