class Payment < ApplicationRecord
  has_paper_trail ignore: [:updated_at, :created_at]
  belongs_to :sale

  def amount_after_change
    value = sale.total_amount - amount

    if value >= 0
      amount
    else
      sale.total_amount
    end
  end
end
