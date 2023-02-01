class ItemCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :items
end
