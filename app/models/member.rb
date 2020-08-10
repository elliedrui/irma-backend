class Member < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true  
  validates :email, uniqueness: true
  has_many :personas, dependent: :destroy
end
