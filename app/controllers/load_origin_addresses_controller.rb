class LoadOriginAddressesController < AddressesController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :validate_hrc_user, only: [:edit, :update, :new, :destroy]
  
  def index
    @addresses = Address.all
  end

  def show
    @load = Load.find(params[:load_id]) 
  end

  def new
    @load = Load.find(params[:load_id]) 
    @driver = @load.driver_user
    #gets latitude column
    @lat = @driver.driver_checkins.pluck(:latitude)
    #gets latest record
    @latitude = @lat.last(1)

    # logic to provide default values if no checkin present
    if 
      @latitude.present? 
      #join removes brackets from array - only shows coords
      @driver_latitude = @latitude.join(', ')
    else
      @driver_latitude = "41.881832"
    end

    @lng = @driver.driver_checkins.pluck(:longitude)
    @longitude = @lng.last(1)

    if 
      @longitude.present? 
      @driver_longitude = @longitude.join(', ')
    else
      @driver_longitude = "-87.623177"
    end
    @address = @load.load_origin_addresses.new 
    @loaa = @load.load_origin_addresses

    @load_origin_addresses = @load.load_origin_addresses.order("created_at asc")
    @load_origin_address = @load.load_origin_addresses.order("created_at asc").last
    # @category = @load_origin_addresses.address_category
  end

  def edit
    @load = Load.find(params[:load_id])
  end
  
  def create
    @load = Load.find(params[:load_id])
    @address = @load.load_origin_addresses.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to load_path(@load), notice: 'Load address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        flash[:error] = @address.errors.full_messages.to_sentence
        format.html { redirect_to :back } 
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @load = Load.find(params[:load_id])
    respond_to do |format|

      if @address.update(address_params)
        format.html { redirect_to edit_load_path(@load), notice: 'Load address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @load = Load.find(params[:load_id])
    @address.destroy
    respond_to do |format|
      format.html { redirect_to load_path(@load), notice: 'Load address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end
    


    def address_params
      params.require(:load_origin_address).permit(  
        :type, 
        :street, 
        :latitude, 
        :longitude, 
        :city, 
        :state, 
        :zip, 
        :company,  
        :contact, 
        :phone, 
        :load_id,
        :notes,
        :type,
        :pick_up_delivery,
        :miles,
        :pick_up_date,
        :address_category_id
        )
        
    end

end

