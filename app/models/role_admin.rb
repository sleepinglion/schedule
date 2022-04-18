class RoleAdmin < ActiveRecord::Base
    belongs_to :role, autosave: true
    belongs_to :admin, autosave: true
end
