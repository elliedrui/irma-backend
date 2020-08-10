class Persona < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :guns, dependent: :destroy
  has_many :vehicles, dependent: :destroy
  belongs_to :faction
  belongs_to :member
end
