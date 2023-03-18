require 'rails_helper'

RSpec.describe LineItem, type: :model do
  context "#flash_total_price" do
    it "should return total price" do
      line_item = LineItem.new(price:1.1,quantity:3)
      expect(line_item.flash_total_price).to eq(3.3)
    end
    
    it "should update total price after create" do
      line_item = create(:line_item)
      p = line_item.price
      q = line_item.quantity
      expect(line_item.total_price).to eq(p*q)
    end

    it "should update total price after save" do
      line_item = create(:line_item)
      line_item.price = 2.4
      line_item.quantity = 2
      line_item.save
      expect(line_item.total_price).to eq(4.8)
    end
  end
end
