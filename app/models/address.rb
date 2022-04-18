class Address < ActiveRecord::Base
    validates_presence_of :title
    belongs_to :address_category, autosave: true
end
