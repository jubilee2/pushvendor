class CreateJoinTableItemCategoryItem < ActiveRecord::Migration[7.0]
  def change
    create_join_table :item_categories, :items do |t|
      t.index [:item_category_id, :item_id]
      # t.index [:item_id, :item_category_id]
    end

    remove_column :items, :item_category_id, :integer
  end
end
