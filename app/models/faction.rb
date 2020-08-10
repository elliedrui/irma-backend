class Faction < ApplicationRecord
  has_many :personas, dependent: :destroy
end
