class Jet < ApplicationRecord
  belongs_to :user # Relation avec le modèle User

  validates :name, :description, :price_per_hour, :location, presence: true
end
