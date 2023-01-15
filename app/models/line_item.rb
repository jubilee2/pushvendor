class LineItem < ApplicationRecord
  belongs_to :sale
  belongs_to :item

  before_save :flash_total_price

  def flash_total_price
    self.total_price = price * quantity
  end

  def remove_item_from_stock(qty_change)
    self.transaction do
      reload
      item.transaction do
        self.quantity += qty_change
        self.item.stock_amount -= qty_change
        self.item.amount_sold += qty_change
        self.item.save
        if quantity == 0
          self.destroy
        else
          self.save
        end
      end
    end
  end

end
