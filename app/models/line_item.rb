class LineItem < ApplicationRecord
  belongs_to :sale
  belongs_to :item

  before_save :flash_total_price

  def flash_total_price
    self.total_price = price * quantity
  end
end
