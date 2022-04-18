class Branch < ActiveRecord::Base
    validates_presence_of :title
    has_many :orders, dependent: :destroy
end
