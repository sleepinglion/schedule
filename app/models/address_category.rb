class AddressCategory < ActiveRecord::Base
    validates_presence_of :title
    has_many :addresses
end
