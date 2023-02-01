class Item < ApplicationRecord
  has_many :line_items
  has_and_belongs_to_many :item_categories

  validates :sku, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :stock_amount, presence: true

  scope :published, -> { where(published: true) }
  
end
