# app/models/booking.rb
class Booking < ApplicationRecord
  STATUSES = %w[pending accepted declined].freeze

  # Validation pour le statut
  validates :status, inclusion: { in: STATUSES }

  # Associations
  belongs_to :jet
  belongs_to :user

  # Validation des champs obligatoires
  validates :airport, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  # Callback pour définir un statut par défaut
  after_initialize :set_default_status, if: :new_record?

  private

  # Validation pour vérifier que la date de fin est après la date de début
  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date <= start_date
      errors.add(:end_date, "doit être après la date de début")
    end
  end

  # Définit un statut par défaut à "pending" si aucune valeur n'est définie
  def set_default_status
    self.status ||= 'pending'
  end
end
