class Address < ActiveRecord::Base
    validates_presence_of :title
    belongs_to :address_category, counter_cache: true
    has_many :users
end
