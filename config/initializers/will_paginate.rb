#https://stackoverflow.com/questions/14958438/rails-activeadmin-undefined-method-per-for-activerecordrelation0x4d15ee
# Active Admin need kaminari pagination If you want to use will paginate, you can make alias for will paginate functions to match kaminari one:
# config/initializers/will_paginate.rb
if defined?(WillPaginate)
  ActiveSupport.on_load :active_record do
    module WillPaginate
      module ActiveRecord
        module RelationMethods
          def per(value = nil) per_page(value) end
          def total_count() count end
        end
      end
      module CollectionMethods
        alias_method :num_pages, :total_pages
      end
    end
  end
end
