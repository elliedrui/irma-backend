class Member < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true  
  validates :email, uniqueness: true
  has_many :personas, dependent: :destroy
  accepts_nested_attributes_for :personas, allow_destroy: true
end
