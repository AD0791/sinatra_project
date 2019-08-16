class Reservation < ActiveRecord::Base
    belongs_to :client
    validates_presence_of :bed_size, :occupancy, :date, :room, :number_of_day
end
