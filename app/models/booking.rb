class Booking < ApplicationRecord
  has_many :passengers
  belongs_to :flight
  accepts_nested_attributes_for :passengers, allow_destroy: true
  validates_associated :passengers
end
