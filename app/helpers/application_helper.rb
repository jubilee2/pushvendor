module ApplicationHelper
  def raw_sales
    sales = Sale.all
    total = 0.00
    sales.each do |sale|
      unless sale.total_amount.blank?
        total += sale.total_amount
      end
    end
    total
  end

  def payment_total
    payments = Payment.all
    payment_total = 0.00
    payments.each do |payment|
      payment_total += payment.amount.blank? ? 0.00 : payment.amount_after_change
    end
    payment_total
  end

  def owed_balance
    raw_sales - payment_total
  end

  def sales_total_today
    total = 0.00
    sales = Payment.where('created_at >= ?', Time.zone.now.beginning_of_day)
    sales.each do |sale|
      total += sale.amount
    end
    total
  end

  def get_http(url)
    unless url.blank? || url.starts_with?('http://') || url.starts_with?('https://')
      url = "http://#{url}"
    end
    url
  end

  def config
    @configurations
  end
end
