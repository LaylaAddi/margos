class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :driver_list, :app_variable, :national_average_diesel
   
  around_action :user_time_zone, if: :current_user
  
  def app_variable
    @app_variable = AppVariable.first
  end
  
  def driver_list 
    @driver_list = DriverUser.where(["employment_status = ?", "active"]).order('first_name ASC')   
  end
  
  
  def national_average_diesel

  page = Nokogiri::HTML(open('https://www.eia.gov/petroleum/weekly/'))
  @national_average_diesel_price = page.xpath('//*[@id="rp_diesel"]/td[2]').text

# begin
#     @national_average_diesel_price = page.xpath('//*[@id="rp_diesel"]/td[2]').text
# rescue
#   @national_average_diesel_price = 0 
# else
#   @national_average_diesel_price = page.xpath('//*[@id="rp_diesel"]/td[2]').text
# end  

  
  end
  devise_group :user, contains: [:company_user, :shipper_user, :driver_user] 
  devise_group :company_user, contains: [:company_user] 
  devise_group :shipper_user, contains: [:shipper_user] 
  devise_group :driver_user, contains: [:driver_user] 
  before_action :authenticate_user!

  private
    def validate_company_user
      if !current_company_user
        redirect_to root_path
      flash[:danger] = " #{current_user.first_name}, The function requested does not exist or you are not authorized for access."
      end
    end
    
    def user_time_zone(&block)
    	Time.use_zone(current_user.time_zone, &block)
    end
    
end












