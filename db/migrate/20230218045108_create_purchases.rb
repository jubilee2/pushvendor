class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.datetime :order_date
      t.datetime :recived_date
      t.text :note
      t.decimal :shipping_fee, precision: 8, scale: 2
      t.decimal :tax, precision: 8, scale: 2
      t.decimal :amount, precision: 8, scale: 2
      t.boolean :received, :default => false

      t.timestamps
    end
  end
end
