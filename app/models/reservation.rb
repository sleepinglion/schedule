class Reservation < ApplicationRecord
  after_initialize :default_values

  belongs_to :order, counter_cache: true
  has_many :reservation, dependent: :destroy

  private

  def default_values
    self.transaction_date ||= Date.today
  end
end
