desc 'Load Pushvendor default configuration data.'

namespace :pushvendor do
  for i in (1..2000)
    Item.create(:sku => i, :name => "#{i}Name", :price => "12.00", :stock_amount => "100")
  end
end
