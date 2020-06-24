class Office < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings
  has_many :users, through: :bookings
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  validates :address, presence: true
end
