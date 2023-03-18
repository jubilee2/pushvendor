json.array! @available_items do |item|
  json.id item.id
  json.name item.name
  json.stock_amount item.stock_amount
end
