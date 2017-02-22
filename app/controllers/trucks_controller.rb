class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy]
  before_action :validate_company_user, except: [:show]   

  def index

    @trucks = Truck.all
    respond_to do |format|
      format.html 
      format.csv { send_data @trucks.as_csv }  
    end
  end


  def show
    @truck_image = TruckImage.new
    @truck_images = @truck.truck_images
    @truck_mile = TruckMile.new  
    @truck_miles = @truck.truck_miles 
    @driver = @truck.driver_user 
  end


  def new
    @driver = DriverUser.where(["employment_status = ?", "active"]) 
    @truck = Truck.new
  end


  def edit
    @driver = DriverUser.where(["employment_status = ?", "active"]) 
  end


  def create
    @driver = DriverUser.where(["employment_status = ?", "active"]) 
    @truck = Truck.new(truck_params)

    respond_to do |format|
      if @truck.save
        format.html { redirect_to @truck, notice: 'Truck was successfully created.' }
        format.json { render :show, status: :created, location: @truck }
      else
        format.html { render :new }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @truck.update(truck_params)
        format.html { redirect_to @truck, notice: 'Truck was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck }
      else
        format.html { render :edit }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @truck.destroy
    respond_to do |format|
      format.html { redirect_to trucks_url, notice: 'Truck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import
    Truck.import(params[:file])
    redirect_to trucks_path, notice: 'Trucks have been uploaded.'
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck
      @truck = Truck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_params
      params.require(:truck).permit(
                                    :year, 
                                    :make, 
                                    :model, 
                                    :color, 
                                    :number, 
                                    :vin, 
                                    :image, 
                                    :notes, 
                                    :driver_user_id, 
                                    :service_status,
                                    :city, 
                                    :state, 
                                    :zip, 
                                    :latitude,
                                    :longitude,
                                    :plate,
                                    :plate_state,
                                    :average_mpg
                                    )
    end
end
