class Item < ApplicationRecord
  has_many :line_items
  has_and_belongs_to_many :item_categories
  before_destroy { item_categories.clear }

  validates :sku, uniqueness: true, allow_blank: true
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :stock_amount, presence: true

  scope :published, -> { where(published: true) }
  
end
