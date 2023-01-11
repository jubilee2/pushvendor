class StoreConfiguration < ApplicationRecord
  def get_tax_rate
    tax_rate.blank? ? 0.00 : tax_rate.to_f * 0.01
  end
end
