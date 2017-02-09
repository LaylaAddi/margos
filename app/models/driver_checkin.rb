class DriverCheckin < ApplicationRecord
  belongs_to :driver_user 
  
  reverse_geocoded_by :latitude, :longitude, address: :street
after_validation :geocode
  
  # def address  
  #   [ from_city, from_state, from_zip].join(', ') 
  # end
end
