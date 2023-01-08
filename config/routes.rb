PushvendorPos::Application.routes.draw do
  devise_for :users
  root 'dashboard#index'

  authenticated :user do
    resources :item_categories
  
    resources :reports do
      collection do
        get 'total_report'
        get 'date_range_report'
        get 'customer_report'
        get 'item_report'
      end
    end
  
    resources :payments do
      collection do
        get 'make_payment'
      end
    end
  
    resources :configurations do 
      collection do 
        get 'update'
      end
    end
  
    resources :customers
  
    resources :items do
      get 'search'
      collection do
        get 'search'
      end
    end
  
    resources :sales do
      collection do
        get 'update_line_item_options'
        get 'update_customer_options'
        get 'create_line_item'
        get 'update_totals'
        get 'add_item'
        get 'remove_item'
        get 'create_customer_association'
        get 'create_custom_item'
        get 'create_custom_customer'
        get 'add_comment'
        post 'override_price'
        post 'sale_discount'
      end
    end
  
    resources :dashboard do
      collection do
        get 'create_sale_with_product'
      end
    end
  
    resources :users
  
  end

end
