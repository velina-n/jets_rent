class Jet < ApplicationRecord
  belongs_to :user # Relation avec le modèle User
  has_many :bookings

  validates :name, :description, :price_per_hour, :location, presence: true
end
