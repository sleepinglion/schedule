class Receipt < ApplicationRecord
  validates_presence_of :title
  validates_length_of :title, within: 2..200
  has_many :orders
end
