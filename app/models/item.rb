class Item < ApplicationRecord
	has_many :line_items
	belongs_to :item_category, optional: true

	validates :sku, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
	validates :price, presence: true
	validates :stock_amount, presence: true
end
