class StoreConfiguration < ApplicationRecord
  def get_tax_rate
    self.tax_rate.blank? ? 0.00 : self.tax_rate.to_f * 0.01
  end
end
