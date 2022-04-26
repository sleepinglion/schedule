class Order < ApplicationRecord
  after_initialize :default_values

  validates_presence_of :user_id, :branch_id
  belongs_to :user, counter_cache: true
  belongs_to :branch, counter_cache: true
  belongs_to :receipt, counter_cache: true, optional: true
  has_many :accounts

  def total_account_payment
    self.accounts.sum(:payment)
  end

  private

  def default_values
    self.contract_date ||= Date.today
  end
end
