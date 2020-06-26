class Booking < ApplicationRecord
  belongs_to :office
  belongs_to :user

  validates :category, inclusion: { in: %w[Rent Visit] }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
