class Jet < ApplicationRecord
  belongs_to :user # Relation avec le modèle User
  has_many :bookings
  has_many_attached :images

  validates :airport, presence: true
end
