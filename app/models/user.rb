class User < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, within: 2..200
  has_one :user_picture, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :accounts, dependent: :destroy
end

