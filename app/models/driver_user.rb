class DriverUser < User
  has_many :loads
  has_many :trucks  
  has_many :trailers 
  has_many :driver_statements, through: :loads
  has_many :driver_statements
  has_many :driver_checkins
  has_many :messages 
  belongs_to :driver_rate     
  validates :driver_rpm, :numericality => { :only_decimal => true, on: :update,
    :message => "Set A Rate - Select 0.00 if Owner Operator" } 
  ransack_alias :driver_search_params,
  :first_name_or_last_name_or_email 
  mount_uploader :profile_image, UserProfileImageUploader  
  mount_uploader :profile_bg, UserBackgroundImageUploader  


  def plus_one_cell
    '+1'+self.cellphone 
  end

  def driver_rate_set_in_model 
    self.driver_rate.amount 
  end
  

 private
 
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
    	DriverUser.create! row.to_hash
  	end
  end   

  
end