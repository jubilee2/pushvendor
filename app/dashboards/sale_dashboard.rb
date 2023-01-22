require "administrate/base_dashboard"

class SaleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    amount: Field::Number.with_options(searchable: false, decimals: 2),
    comments: Field::Text,
    customer: Field::BelongsTo,
    discount: Field::Number.with_options(searchable: false, decimals: 2),
    line_items: Field::HasMany,
    payments: Field::HasMany,
    remaining_amount: Field::Number.with_options(searchable: false, decimals: 2),
    tax: Field::Number.with_options(searchable: false, decimals: 2),
    total_amount: Field::Number.with_options(searchable: false, decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    created_at
    total_amount
    tax
    remaining_amount
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    amount
    comments
    customer
    discount
    line_items
    payments
    remaining_amount
    tax
    total_amount
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    comments
    customer
    discount
    remaining_amount
    tax
    total_amount
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

  # Overwrite this method to customize how sales are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(sale)
  #   "Sale ##{sale.id}"
  # end
end
