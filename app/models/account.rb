class Account < ApplicationRecord
  after_initialize :default_values
  belongs_to :account_category, counter_cache: true
  belongs_to :user, counter_cache: true
  belongs_to :receipt, counter_cache: true
  has_many :account_orders, dependent: :destroy
  has_many :orders, :through => :account_orders
  private

  def default_values
    self.transaction_date ||= Date.today
  end
end
