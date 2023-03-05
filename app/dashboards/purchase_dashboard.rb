require "administrate/base_dashboard"

class PurchaseDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    all_versions: Field::HasMany.with_options(class_name: "PaperTrail::Version"),
    id: Field::Number,
    amount: Field::Number.with_options(searchable: false, decimals: 2),
    item_purchases: Field::NestedHasMany.with_options(skip: :purchase),
    note: Field::Text,
    order_date: Field::DateTime,
    received: Field::Boolean,
    recived_date: Field::DateTime,
    shipping_fee: Field::Number.with_options(searchable: false, decimals: 2),
    tax: Field::Number.with_options(searchable: false, decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    item_purchases
    order_date
    recived_date
    amount
    received
    created_at
    updated_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    item_purchases
    order_date
    received
    recived_date
    note
    shipping_fee
    tax
    amount
    created_at
    updated_at
    all_versions
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    item_purchases
    order_date
    recived_date
    note
    shipping_fee
    tax
    amount
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how purchases are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(purchase)
  #   "Purchase ##{purchase.id}"
  # end
end
