class Load < ApplicationRecord
  

  belongs_to :company_user 
  belongs_to :driver_user 
  belongs_to :company_profile 
  has_many :percentages 
  has_many :transactions, as: :transactionable
  accepts_nested_attributes_for :transactions 
  belongs_to :driver_statement, optional: true 
  has_many :load_documents, dependent: :destroy  

  has_many :load_origin_addresses, dependent: :destroy 
  accepts_nested_attributes_for :load_origin_addresses
  before_validation :set_company_driver_rate, :set_company_driver_percent 
  # before_save :set_booking_fee, :set_rate_to_driver_after_factor_fees, :company_driver_rate
  # before_update :set_booking_fee, :set_rate_to_driver_after_factor_fees, :company_driver_rate

  
  before_validation :delivery_date, date: { after_or_equal_to: Proc.new { :pick_up_date }, 
  message: "(error) Delivery can't be before pick up" }, on: :create
  
  # before_validation :delivery_date, date: { after_or_equal_to: Proc.new { :pick_up_date },  
  # message: "(error) Delivery can't be before pick up" }, on: :update
  
 
  
  validates_presence_of  :load_size, :percent_deducted, :pick_up_date,
  :equipment_type, :status_name, :driver_user_id, :company_profile, :percent_deducted,
  :rate_to_owner_operator, :invoice_price, :origin_street, :origin_city, :origin_state

  validates :destination_street, :destination_city, :miles, :destination_state, :delivery_date,
  presence: true, unless: :has_multiple_pd?
  validates :percent_coverted_to_dollars, presence: true, unless: :is_company_driver

  ransack_alias :load_search_params,
  :driver_user_first_name_or_driver_user_last_name_or_origin_city_or_destination_city_or_origin_state_or_destination_state_or_company_profile_company_name_or_broker_shipper_load_id
 

   
  def is_company_driver
      driver_user.try(:company_driver) == true
  end
  
  def set_company_driver_rate
    self.rate_to_owner_operator = 0.00 if is_company_driver
  end
  
  def set_company_driver_percent
    self.percent_deducted = 0.00 if is_company_driver
  end




  def grpm
    self.invoice_price / self.miles 
  end
  
 
  def ddbop #dollars deducted based on percent
  self.rate_to_owner_operator * self.percent_deducted
  end
  
  def booking_fee_plus_percent_in_dollars
    self.booking_fee + ddbop
  end
  
  def company_rpm
    booking_fee_plus_percent_in_dollars / self.miles 
  end
  
  def set_rate_to_driver_after_factor_fees
  self.rate_to_driver_after_factor_fees = self.rate_to_company_driver - ddbop 
  end
  

  def destination
    load_origin_addresses.where(["address_category_id = ?", 4]).last 
  end
  def destination_map
    load_origin_addresses('created_at desc').last  
  end

  
  def title
    if self.destination_city.present? && self.destination_state.present?
      " Origin: " + self.origin_city + " " + self.origin_state + " " + "Destination: " + 
      self.destination_city + " " + self.destination_state
    elsif self.origin_city.present? && self.origin_state.present? && destination.present?
       " Origin: " + self.origin_city + " " + self.origin_state + " " + "Destination: " + 
      destination.city + " " + destination.state
    elsif self.origin_city.present? && self.origin_state.present? && !destination.present?
       " Origin: " + self.origin_city + " " + self.origin_state + " " + "Destination: *None Set*" 
    end
  end

  def origin_address
    return self.origin_street + ", " + self.origin_city + ", " + self.origin_state + ", " + self.origin_zip
  end
  
  def destination_address
    if destination.try(:city).blank? and destination.try(:state).blank?
    return self.destination_street + ", " + self.destination_city + ", " + self.destination_state + ", " + self.destination_zip
    else
    destination.street + " " + destination.city + " " + destination.state + " " + destination.zip  
    end
  end
  

  
  def self.as_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
  
	def self.import(file)	
  	CSV.foreach(file.path, headers: true) do |row|
    	Load.create! row.to_hash     
    end
  end  
end
