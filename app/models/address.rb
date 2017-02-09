class Address < ApplicationRecord
  # validates :order, numericality: { only_integer: true } 
  # validates :order, uniqueness: { scope: :load,
  #   message: "This address slot has been taken" }  
  has_many :load_originaddress_categories
end 
