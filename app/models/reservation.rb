class Reservation < ApplicationRecord
  belongs_to :order, counter_cache: true
  has_many :reservation, dependent: :destroy
end
