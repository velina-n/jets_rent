class Jet < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  # Attribut virtuel pour désactiver temporairement la validation des images
  attr_accessor :skip_image_validation

  # Validations
  validates :model, :price, :capacity, presence: true
  validates :images, presence: true, unless: -> { skip_image_validation }

  # Autres méthodes ou logiques du modèle (si nécessaire)
end
