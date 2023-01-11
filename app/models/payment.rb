class Payment < ApplicationRecord
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
