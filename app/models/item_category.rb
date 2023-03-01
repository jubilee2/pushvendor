class ItemCategory < ApplicationRecord
  has_paper_trail ignore: [:updated_at, :created_at]
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :items
end
