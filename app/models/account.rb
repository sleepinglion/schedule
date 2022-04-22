class Account < ApplicationRecord
  after_initialize :default_values
  belongs_to :account_category, counter_cache: true
  belongs_to :user, counter_cache: true
  belongs_to :order, counter_cache: true
  private

  def default_values
    self.transaction_date ||= Date.today
  end
end
