class Jet < ApplicationRecord
  belongs_to :user # Relation avec le modèle User
  has_many :bookings

end
