class DashboardController < ApplicationController
  def index
    @recent_sales = Sale.all.order('id DESC').limit(10)
    @popular_items = Item.all.order('amount_sold DESC').limit(10)
  end
end
