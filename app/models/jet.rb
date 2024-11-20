class Jet < ApplicationRecord
  belongs_to :user # Relation avec le modèle User
  has_many :bookings

  # Validations
  validates :model, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :available, inclusion: { in: [true, false] }
end
