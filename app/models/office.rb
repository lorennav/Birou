class Office < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings
  has_many :users, through: :bookings
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_full_name, against: {
    address: 'A',
    name: 'B',
    description: 'C'
  },
  using: {
    tsearch: { prefix: true }
  }
end
