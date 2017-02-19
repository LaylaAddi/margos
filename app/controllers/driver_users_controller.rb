class DriverUsersController < UsersController 
  include ApplicationHelper
  before_action :validate_company_user, only: [:edit, :update, :new, :destroy]
  
  def index
  	@search = DriverUser.search(params[:q])
  	@drivers = @search.result.order(:id).page(params[:page]).per(1000) 

    respond_to do |format|
      format.html
      format.csv { send_data @drivers.as_csv } 
    end
  end
  

  def update
    @user = User.find(params[:id])
    if params[:driver_user][:password].blank?
      params[:driver_user].delete(:password)
      params[:driver_user].delete(:password_confirmation) 
    end
    
    if @user.update(user_params)
      flash[:success] = "The user was updated"
      redirect_to @user
    else
        flash[:error] = @user.errors.full_messages.to_sentence
      render :edit  
    end
  end 
  
  def show 
    @driver = DriverUser.find(params[:id]) 
    @driver_rate_per_mile = @driver.driver_rate
    @company_user = current_company_user
  	@driver_statements = @driver.driver_statements if !nil? 
    @active = @driver.loads.where(["status_name = ?", "Active"])
  	@search_active = @active.search(params[:q])
  	@active_loads = @search_active.result.order(:id).page(params[:page]).per(1000) 
    @loads_no_statement = @driver.loads.where("driver_statement_id is NULL")
    @complete = @loads_no_statement.where(["status_name = ?", "Complete"])
  	@search_complete = @complete.search(params[:q])
  	@completed_loads = @search_complete.result.order(:id).page(params[:page]).per(1000) 
  	@trucks = @driver.trucks 
  	@trailers = @driver.trailers 
    #@text_load = @active.last 
    @message = Message.last
    @messages = Message.all.order('created_at desc')
    @driver_checkins_14 = @driver.driver_checkins.order('created_at asc').last(9)  
    # @ip = request.remote_ip 
    # @location = Geocoder.coordinates(@ip)
    # @lat = request.location.latitude 
    # @lon = request.location.longitude
    # @city = request.location.city
    # @region = request.location.region
    #@postal_code = request.location.zip_code
#     @latitude = @lat.last(1)
    
    @lat = @driver_checkins_14.pluck(:latitude) 
    @lng = @driver_checkins_14.pluck(:longitude)
    
    @lat_0 = @lat[0]
    @lat_1 = @lat[1]
    @lat_2 = @lat[2]
    @lat_3 = @lat[3]
    @lat_4 = @lat[4]
    @lat_5 = @lat[5]
    @lat_6 = @lat[6]
    @lat_7 = @lat[7]
    @lat_8 = @lat[8]
    @lat_9 = @lat[9]
    @lat_10 = @lat[10]
    @lat_11 = @lat[11]
    @lat_12 = @lat[12]
    @lat_13 = @lat[13]
    @lat_14 = @lat[14]
    @lat_15 = @lat[15]
    @lat_16 = @lat[16]
    @lat_17 = @lat[17]
    @lat_18 = @lat[18]
    @lat_19 = @lat[19]
    @lat_20 = @lat[20]
    @lat_21 = @lat[21]
    @lat_22 = @lat[22]
    @lat_23 = @lat[23]
    @lat_24 = @lat[24]
    
    @lng_0 = @lng[0]
    @lng_1 = @lng[1]
    @lng_2 = @lng[2]
    @lng_3 = @lng[3]
    @lng_4 = @lng[4]
    @lng_5 = @lng[5]
    @lng_6 = @lng[6]
    @lng_7 = @lng[7]
    @lng_8 = @lng[8]
    @lng_9 = @lng[9]
    @lng_10 = @lng[10]
    @lng_11 = @lng[11]
    @lng_12 = @lng[12]
    @lng_13 = @lng[13]
    @lng_14 = @lng[14]
    @lng_15 = @lng[15]
    @lng_16 = @lng[16]
    @lng_17 = @lng[17]
    @lng_18 = @lng[18]
    @lng_19 = @lng[19]
    @lng_20 = @lng[20]
    @lng_21 = @lng[21]
    @lng_22 = @lng[22]
    @lng_23 = @lng[23]
    @lng_24 = @lng[24]

    
  end
    
  def driver_dashboard
    @driver = current_driver_user
  	@driver_statements = @driver.driver_statements if !nil? 
    @active = @driver.loads.where(["status_name = ?", "Active"])
  	@search_active = @active.search(params[:q])
  	@active_loads = @search_active.result.order(:id).page(params[:page]).per(1000) 
  	
    @loads_no_statement = @driver.loads.where("driver_statement_id is NULL")
    @complete = @driver.loads.where(["status_name = ?", "Complete"])
  	@search_complete = @complete.search(params[:q])
  	@completed_loads = @search_complete.result.order(:id).page(params[:page]).per(1000) 
  	
    @cancelled = @driver.loads.where(["status_name = ?", "Complete"])
  	@search_cancelled = @cancelled.search(params[:q])
  	@completed_loads = @search_cancelled.result.order(:id).page(params[:page]).per(1000) 
  	
  	@trucks = @driver.trucks 
  	@trailers = @driver.trailers 
  	
    @driver_checkin = DriverCheckin.new
    @driver_checkins = @driver.driver_checkins
    
    @ip = request.remote_ip 
    @location = Geocoder.coordinates(@ip)
    # latitude = params[:latitude]
    # longitude = params[:longitude]
    # @lat = request.location.latitude  
    # @lon = request.location.longitude
    # @city = request.location.city
    # @region = request.location.region
    #@postal_code = request.location.zip_code
  end
 
  def import
    @import = DriverUser.import(params[:file])
    flash[:success] = 'Drivers have been imported!'
    redirect_to driver_users_path
  end




  
  private
  

    
    def validate_driver_user
      if !current_driver_user
        redirect_to root_path
      flash[:danger] = " #{current_user.first_name}, The function requested does not exist or you are not authorized for access."
      end
    end

  def user_params
    params.require(:driver_user).permit(:password, 
                                        :password_confirmation,
                                        :current_password,
                                        :email,
                                        :first_name,
                                        :last_name,
                                        :telephone,
                                        :extention,
                                        :cellphone,
                                        :street, 
                                        :city, 
                                        :state, 
                                        :zip,  
                                        :type,
                                        :image, 
                                        :profile_image,
                                        :emergency_contact,
                                        :emergency_contact_number,
                                        :employment_status,
                                        :company_driver, 
                                        :driver_rpm,
                                        :time_zone,
                                        :company_driver,
                                        :owner_operator,
                                        :owner_operator_pbm,
                                        :driver_rate_id,
                                        :amount
                                        )
                              
  end
end