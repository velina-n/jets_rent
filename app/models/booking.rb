class Booking < ApplicationRecord
  belongs_to :jet
  belongs_to :user

  validates :airport, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: %w[pending accepted refused] }
  validate :end_date_after_start_date

  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= "pending"
  end

  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date <= start_date
      errors.add(:end_date, "doit être après la date de début")
    end
  end
end
