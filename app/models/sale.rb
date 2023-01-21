class Sale < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  has_many :payments, dependent: :destroy

  accepts_nested_attributes_for :line_items, allow_destroy: true
  accepts_nested_attributes_for :items, allow_destroy: true
  accepts_nested_attributes_for :payments, allow_destroy: true

  def self.discount_ranges
    0.step(100, 5).collect do |disc|
      dec_discount = (disc.to_d / 100).to_s
      ["#{disc} %", dec_discount]
    end
  end

  def remaining_balance
    balance = if total_amount.blank?
                0.00
              else
                total_amount - paid_total
              end

    if balance.negative?
      0
    else
      balance.round(2)
    end
  end

  def get_discounted_amount
    amount * discount
  end

  def paid_total
    paid_total = 0.00
    unless payments.blank?
      payments.each do |payment|
        paid_total += payment.amount.blank? ? 0.00 : payment.amount
      end
    end
    paid_total
  end

  def change_due
    if total_amount.blank?
      0.00
    elsif paid_total > total_amount
      paid_total - total_amount
    else
      0.00
    end
  end
end
