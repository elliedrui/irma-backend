class Persona < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :guns, dependent: :destroy
  has_many :vehicles, dependent: :destroy
  belongs_to :faction
  belongs_to :member
  accepts_nested_attributes_for :addresses, :guns, :vehicles
end
