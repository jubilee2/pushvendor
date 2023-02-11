require 'roo'

class ItemsController < ApplicationController
  load_and_authorize_resource

  def index
    @items = @items.paginate(page: params[:page], per_page: 20).where(published: true)
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.published = true

    if @item.save
      flash[:notice] = 'Item was successfully created.'
      redirect_to @item
    else
      render action: 'new'
    end
  end

  def update
    if @item.update(item_params)
      flash[:notice] = 'Item was successfully updated.'
      redirect_to @item
    else
      render action: 'edit'
    end
  end

  def destroy
    @item.published = false
    @item.save

    redirect_to items_url
  end

  def import
    csv_file = params[:csv_file]
    xlsx = Roo::Spreadsheet.open(csv_file.path)
    items = xlsx.parse(headers: true).drop(1)
    data = []

    items.each do |row|
      categories_ids = []
      ["SectionInfo", "Author", "Language", "BookType"].each do |c|
        if row[c].present?
          category = ItemCategory.find_or_create_by(name: row[c], description: c)
          categories_ids.push(category.id)
        end
      end

      data.push({
        name: row['BookTitle'],
        description: {
          BookID: row['BookID'],
          Supplier: row['Supplier'],
          LSMcatalog: row['LSMcatalog'],
          OtherSourceLink: row['OtherSourceLink'],
          BookQty_Ordered: row['BookQty_Ordered'],
          RetailPrice: row['RetailPrice'],
          Status: row['Status'],
          CreatedBy: row['CreatedBy'],
          BookQty_Sold: row['BookQty_Sold']
        }.compact.to_json,
        price: row['BRprice'],
        stock_amount: row['BookQty_Available'],
        cost_price: row['DisPrice'],
        item_category_ids: categories_ids
      })
    end

    @errors = []
    data.each do |item|
      i = Item.create item
      @errors.push(i.errors.to_json) if i.errors.present?
    end

    redirect_to items_url
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:image_url,
                                 :sku,
                                 :name,
                                 :description,
                                 :price,
                                 :stock_amount,
                                 :cost_price,
                                 :published,
                                 item_category_ids: [])
  end
end
