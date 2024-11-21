class Jet < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :model, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :images, presence: { message: "must be attached" }
end
