class User < ApplicationRecord
  has_paper_trail ignore: [:updated_at, :created_at, :encrypted_password]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
end
