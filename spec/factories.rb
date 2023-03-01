FactoryGirl.define do
  factory :item_purchase do
    item nil
    purchase nil
    quantity 1
    price "9.99"
    unit_price "9.99"
  end
  factory :purchase do
    order_date "2023-02-17 22:51:08"
    recived_date "2023-02-17 22:51:08"
    note "MyText"
    shipping_fee "9.99"
    tax "9.99"
    amount "9.99"
    received false
  end
  factory :account do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.zone.today
  end

  factory :user do
    email { Faker::Internet.email }
    encrypted_password '$2a$10$BcgADiGLA5jzdj43nGdxo.nWREBlzjFDloaUXeB199QZJt1LFTlvG'
    password 'password'
    password_confirmation 'password'
  end

  factory :sale do
    amount 15.0
    total_amount 17.0
    remaining_amount 0.0
    discount 0.0
    tax 0.8
    customer_id nil
  end

  factory :payment do
    sale_id 1
    amount 15.0
    payment_type 'cash'
  end

  factory :item do
    name { Faker::Book.unique.title }
    sku { Faker::Number.unique.number(digits: 10) }
    price { Faker::Number.decimal(l_digits: 2) }
    stock_amount { rand(20) }
  end

  factory :line_item do
    item
    sale
    price { Faker::Number.decimal(l_digits: 2) }
    quantity { rand(20) }
  end
end
