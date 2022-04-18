class Order < ApplicationRecord
  after_initialize :default_values

  validates_presence_of :user_id,:total_price,:total_discount
  belongs_to :user, counter_cache: true
  belongs_to :branch, counter_cache: true
  has_many :account_orders, dependent: :nullify
  has_many :accounts, through: :account_orders

  private

  def default_values
    self.transaction_date ||= Date.today
  end
end
