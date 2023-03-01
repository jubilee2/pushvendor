class ItemPurchase < ApplicationRecord
  has_paper_trail ignore: [:updated_at, :created_at]
  belongs_to :item
  belongs_to :purchase

  def sub_total_price
    price * quantity
  end
end
