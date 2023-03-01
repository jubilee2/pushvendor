require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    versions: Field::HasMany.with_options(class_name: "PaperTrail::Version"),
    id: Field::Number,
    can_remove_sales: Field::Boolean,
    can_update_configuration: Field::Boolean,
    can_update_items: Field::Boolean,
    can_update_sale_discount: Field::Boolean,
    can_update_users: Field::Boolean,
    can_view_reports: Field::Boolean,
    current_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String,
    email: Field::Email,
    password: Field::Password,
    password_confirmation: Field::Password,
    last_sign_in_at: Field::DateTime,
    last_sign_in_ip: Field::String,
    remember_created_at: Field::DateTime,
    reset_password_sent_at: Field::DateTime,
    reset_password_token: Field::String,
    sign_in_count: Field::Number,
    username: Field::String,
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
    username
    email
    can_remove_sales
    can_update_configuration
    can_update_items
    can_update_sale_discount
    can_update_users
    can_view_reports
    updated_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    username
    email
    can_remove_sales
    can_update_configuration
    can_update_items
    can_update_sale_discount
    can_update_users
    can_view_reports
    current_sign_in_at
    current_sign_in_ip
    last_sign_in_at
    last_sign_in_ip
    remember_created_at
    reset_password_sent_at
    sign_in_count
    created_at
    updated_at
    versions
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    username
    email
    password
    password_confirmation
    can_remove_sales
    can_update_configuration
    can_update_items
    can_update_sale_discount
    can_update_users
    can_view_reports
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

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
