class Purchase < ApplicationRecord
  has_paper_trail ignore: [:updated_at, :created_at]
  has_many :item_purchases, dependent: :destroy

  accepts_nested_attributes_for :item_purchases, allow_destroy: true

  before_save :flash_unit_price

  def flash_unit_price
    total_price = 0
    item_purchases.each do |item|
      item.unit_price = item.price
      total_price = total_price + item.sub_total_price
    end
    if shipping_fee.present?
      item_purchases.each do |item|
        item.unit_price = item.unit_price + shipping_fee * item.price / total_price
      end
    end
    if tax.present?
      item_purchases.each do |item|
        item.unit_price = item.unit_price + tax * item.price / total_price
      end
    end
  end

  def all_versions
    versions.or(PaperTrail::Version.where(item: item_purchases))
  end
end
