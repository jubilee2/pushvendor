class AddNoteToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :note, :text
  end
end
