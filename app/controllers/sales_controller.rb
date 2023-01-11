class SalesController < ApplicationController
  load_and_authorize_resource

  def index
    @sales = @sales.paginate(page: params[:page], per_page: 2).order('id DESC')
  end

  def new
    @sale = Sale.create
    redirect_to controller: 'sales', action: 'edit', id: @sale.id
  end

  def edit
    @available_items = Item.all.where(published: true).limit(5)
    @available_customers = Customer.all.where(published: true).limit(5)
  end

  def destroy
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale has been deleted.' }
    end
  end

  # searched Items
  def update_line_item_options
    if params[:search][:item_category].blank?
      @available_items = Item.all.where('name LIKE ? AND published = true OR description LIKE ? AND published = true OR sku LIKE ? AND published = true', "%#{params[:search][:item_name]}%", "%#{params[:search][:item_name]}%", "%#{params[:search][:item_name]}%").limit(5)
    elsif params[:search][:item_name].blank?
      @available_items = Item.where(item_category_id: params[:search][:item_category]).limit(5)
    else
      @available_items = Item.all.where('name LIKE ? AND published = true AND item_category_id = ? OR description LIKE ? AND published = true AND item_category_id = ? OR sku LIKE ? AND published = true AND item_category_id = ?', "%#{params[:search][:item_name]}%", "#{params[:search][:item_category]}", "%#{params[:search][:item_name]}%", "#{params[:search][:item_category]}", "%#{params[:search][:item_name]}%", "#{params[:search][:item_category]}").limit(5)
    end

    respond_to do |format|
      format.js
    end
  end

  def update_customer_options
    @available_customers = Customer.all.where('last_name LIKE ? AND published = true OR first_name LIKE ? AND published = true OR email_address LIKE ? AND published = true OR phone_number LIKE ? AND published = true', "%#{params[:search][:customer_name]}%", "%#{params[:search][:customer_name]}%", "%#{params[:search][:customer_name]}%", "%#{params[:search][:customer_name]}%").limit(5)

    respond_to do |format|
      format.js
    end
  end

  def create_customer_association
    unless params[:customer_id].blank?
      @sale.customer_id = params[:customer_id]
      @sale.save
    end

    respond_to do |format|
      format.js { render(file: 'sales/update_customer_association.js') }
    end
  end

  # Add a searched Item
  def create_line_item
    existing_line_item = @sale.line_items.where(item_id: params[:item_id]).first

    if existing_line_item.blank?
      line_item = @sale.line_items.new(item_id: params[:item_id], quantity: 1)
      line_item.price = line_item.item.price
      line_item.save

    else
      existing_line_item.quantity += 1
      existing_line_item.save

    end
    remove_item_from_stock(params[:item_id], 1)

    update_totals

    respond_to do |format|
      format.js { ajax_refresh }
    end
  end

  # Remove Item
  def remove_item
    line_item = @sale.line_items.where(item_id: params[:item_id]).first
    line_item.quantity -= 1
    if line_item.quantity <= 0
      line_item.destroy
    else
      line_item.save
    end

    return_item_to_stock(params[:item_id], 1)

    update_totals

    respond_to do |format|
      format.js { ajax_refresh }
    end
  end

  # Add one Item
  def add_item
    line_item = @sale.line_items.where(item_id: params[:item_id]).first
    line_item.quantity += 1
    line_item.save

    remove_item_from_stock(params[:item_id], 1)

    update_totals

    respond_to do |format|
      format.js { ajax_refresh }
    end
  end

  def create_custom_item
    custom_item = Item.new(params.require(:item).permit(
                             :name, :description, :item_category_id,
                             :price, :stock_amount
                           ))

    custom_item.sku = "CI#{(rand(5..30) + rand(5..30)) * 11}_#{(rand(5..30) + rand(5..30)) * 11}"

    custom_item.save

    custom_line_item = @sale.line_items.new(item_id: custom_item.id,
                                            quantity: custom_item.stock_amount,
                                            price: custom_item.price)
    custom_line_item.save

    update_totals

    respond_to do |format|
      format.js { ajax_refresh }
    end
  end

  def create_custom_customer
    customer = Customer.new(params.require(:customer).permit(
                              :first_name, :last_name,
                              :phone_number, :email_address,
                              :address, :city, :state, :zip
                            ))

    customer.save

    @sale.update customer: customer

    respond_to do |format|
      format.js { render(file: 'sales/update_customer_association.js') }
    end
  end

  def override_price
    line_item = @sale.line_items.where(item_id: params[:line_item][:item_id]).first
    line_item.price = params[:line_item][:price].gsub(@configurations.currency, '')
    line_item.save

    update_totals

    respond_to do |format|
      format.js { ajax_refresh }
    end
  end

  def sale_discount
    @sale.discount = params[:sale][:discount]
    @sale.save

    update_totals

    respond_to do |format|
      format.js { ajax_refresh }
    end
  end

  def update_totals
    tax_amount = @configurations.get_tax_rate
    @sale.reload

    @sale.amount = 0.00

    @sale.line_items.each do |line_item|
      @sale.amount += line_item.total_price
    end

    @sale.tax = @sale.amount * tax_amount
    total_amount = @sale.amount + (@sale.amount * tax_amount)

    if @sale.discount.blank?
      @sale.total_amount = total_amount
    else
      discount_amount = total_amount * @sale.discount
      @sale.total_amount = total_amount - discount_amount
    end

    @sale.save
  end

  def add_comment
    @sale.update(params.require(:sale).permit(:comments))

    respond_to do |format|
      format.js { ajax_refresh }
    end
  end

  def make_payment
    @sale.payments.create(params.require(:payment).permit(:payment_type, :amount))
    respond_to do |format|
      format.js
    end
  end

  private

  def ajax_refresh
    render(file: 'sales/ajax_reload.js.erb')
  end

  def remove_item_from_stock(item_id, quantity)
    item = Item.find(item_id)
    item.stock_amount = item.stock_amount - quantity
    item.amount_sold += quantity
    item.save
  end

  def return_item_to_stock(item_id, quantity)
    item = Item.find(item_id)
    item.stock_amount = item.stock_amount + quantity
    item.amount_sold -= quantity
    item.save
  end
end
