class HrcUsersController < UsersController 
  before_action :validate_hrc_user, only: [:edit, :update, :new, :destroy]
  def index
  	@search = HrcUser.search(params[:q])
  	@hrc_users = @search.result.order(:id).page(params[:page]).per(1000) 
    respond_to do |format|
      format.html
      format.csv { send_data @hrc_users.as_csv } 
    end
  end
  
  def update
    @user = User.find(params[:id])
    if params[:hrc_user][:password].blank? 
      params[:hrc_user].delete(:password)
      params[:hrc_user].delete(:password_confirmation) 
    end
    
    if @user.update!(user_params)
      flash[:success] = "The user was updated"
      redirect_to root_path 
    else
      flash[:error] = "There was a problem" 
      render :edit  
    end
  end 
  
  def show 
    @hrc_user = HrcUser.find(params[:id]) 
    
    @active = @hrc_user.loads.where(["status_name = ?", "Active"])
  	@search_active = @active.search(params[:q])
  	@active_loads = @search_active.result.order(:id).page(params[:page]).per(1000) 
  	
    @complete = @hrc_user.loads.where(["status_name = ?", "Complete"])
  	@search_complete = @complete.search(params[:q])
  	@completed_loads = @search_complete.result.order(:id).page(params[:page]).per(1000) 
  	
    @paid = @hrc_user.loads.where(["status_name = ?", "Paid"])
  	@search_paid = @paid.search(params[:q])
  	@paid_loads = @search_paid.result.order(:id).page(params[:page]).per(1000) 
  	
    @cancelled = @hrc_user.loads.where(["status_name = ?", "Complete"])
  	@search_cancelled = @cancelled.search(params[:q])
  	@completed_loads = @search_cancelled.result.order(:id).page(params[:page]).per(1000) 
  	
  end
  
  def hrc_dashboard 
    @hrc_user = current_hrc_user
    @active = @hrc_user.loads.where(["status_name = ?", "Active"])
  	@search_active = @active.search(params[:q])
  	@active_loads = @search_active.result.order(:id).page(params[:page]).per(1000) 
  	
    @complete = @hrc_user.loads.where(["status_name = ?", "Complete"])
  	@search_complete = @complete.search(params[:q])
  	@completed_loads = @search_complete.result.order(:id).page(params[:page]).per(1000) 
  	
    @paid = @hrc_user.loads.where(["status_name = ?", "Paid"])
  	@search_paid = @paid.search(params[:q])
  	@paid_loads = @search_paid.result.order(:id).page(params[:page]).per(1000) 
  	
    @cancelled = @hrc_user.loads.where(["status_name = ?", "Complete"])
  	@search_cancelled = @cancelled.search(params[:q])
  	@completed_loads = @search_cancelled.result.order(:id).page(params[:page]).per(1000)
  	
    # @city = request.location.city
    # @country = request.location.country_code
    # @user_ip = request.remote_ip
    # @user_latitude = request.location.latitude
    # @user_longitude = request.location.longitude

  end
  
  def import
    HrcUser.import(params[:file])
    redirect_to hrc_users_path, notice: 'HRC Users have been uploaded.'
  end   
  
private

  def user_params
    params.require(:hrc_user).permit(:password, 
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
                                     :profile_b, 
                                     :profile_image,
                                     :emergency_contact,
                                     :emergency_contact_number,
                                     :company_profile_admin,
                                     :admin,
                                     :dispatcher,
                                     :office,
                                     :maintenance,
                                     :shipping_receiving,
                                     :driver,
                                     :employment_status 
                                     )
                              
  end
end
