class Jet < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :model, :price, :capacity, presence: true
  validates :price, numericality: { greater_than: 0 }
end
