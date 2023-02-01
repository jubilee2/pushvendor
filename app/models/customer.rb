class Customer < ApplicationRecord
  has_many :sales

  validates_presence_of :first_name, :last_name
  validates_format_of :email_address, with: URI::MailTo::EMAIL_REGEXP, allow_blank: true

  scope :published, -> { where(published: true) }

end
