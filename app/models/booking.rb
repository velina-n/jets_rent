class Booking < ApplicationRecord
  belongs_to :jet
  belongs_to :user

  validates :airport, :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    if end_date <= start_date
      errors.add(:end_date, "doit être après la date de début")
    end
  end
end
