class Faction < ApplicationRecord
  has_many :personas, dependent: :destroy
  accepts_nested_attributes_for :personas, allow_destroy: true
end
