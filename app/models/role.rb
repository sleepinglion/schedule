class Role < ActiveRecord::Base
    validates_presence_of :title
    has_many :role_admin, dependent: :destroy
    has_many :admin, through: :role_admin, dependent: :destroy
end
