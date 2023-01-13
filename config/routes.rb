Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'dashboard#index'

  authenticated :user do
    resources :item_categories
    resources :items

    resources :reports do
      collection do
        get 'total_report'
        get 'date_range_report'
        get 'customer_report'
        get 'item_report'
      end
    end

    # configurations
    get '/configurations', to: 'configurations#index'
    patch '/configurations', to: 'configurations#update'

    resources :customers

    resources :sales do
      member do
        defaults format: :js do
          post 'update_line_item_options'
          post 'update_customer_options'
          post 'create_line_item'
          post 'add_item'
          post 'remove_item'
          post 'create_customer_association'
          post 'create_custom_item'
          post 'create_custom_customer'
          patch 'add_comment'
          patch 'override_price'
          patch 'sale_discount'

          post 'make_payment'
        end
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
