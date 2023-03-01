class ItemPurchase < ApplicationRecord
  belongs_to :item
  belongs_to :purchase

  def sub_total_price
    price * quantity
  end
end
