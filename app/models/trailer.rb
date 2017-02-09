class Trailer < ApplicationRecord
  belongs_to :driver_user
  has_many :trailer_miles, dependent: :destroy
  has_many :trailer_images, dependent: :destroy
  validates_presence_of :number, :make, :vin, :service_status
  validates_uniqueness_of :number, :vin 
  mount_uploader :image, TrailerImageUploader 
  
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
    	Trailer.create! row.to_hash     
  	end
  end  
end
