class Booking < ApplicationRecord
  belongs_to :office
  belongs_to :user

  validates :category, inclusion: { in: %w(rent visit) }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
