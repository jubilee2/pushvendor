
namespace :pushvendor do
  desc 'Load Pushvendor default configuration data.'
  task :load_default_data do
    for i in (1..2000)
      Item.create(:sku => i, :name => "#{i}Name", :price => "12.00", :stock_amount => "100")
    end
  end
end
