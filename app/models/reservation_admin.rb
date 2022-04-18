class ReservationAdmin < ActiveRecord::Base
    belongs_to :reservation, autosave: true
    belongs_to :admin, autosave: true
end
