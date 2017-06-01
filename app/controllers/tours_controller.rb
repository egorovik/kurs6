class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]
  
  def search
    @result = Tour.search(params)
  end

  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.all
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
  end

  # GET /tours/new
  def new
    @tour = Tour.new
    @tour.build_route.build_city
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)
#    raise "#{params}"
    
    flag = true
    flag1 = true
    if !(params["tour"]["route_id"].empty?)
      @tour.route_id = params["tour"]["route_id"].to_i
    else
      route = Route.new
      route.name = params["tour"]["route_attributes"]["name"]
      route.base_price = params["tour"]["route_attributes"]["base_price"].to_i
      route.descr = params["tour"]["route_attributes"]["descr"]
      
      if !(params["tour"]["route_attributes"]["city_id"].empty?)
        route.city_id = params["tour"]["route_id"].to_i
      else
        city = City.new
        city.name = params["tour"]["route_attributes"]["city_attributes"]["name"]
        flag1 = false if !(city.save)
        route.city = city
      end
      
      flag = false if !(route.save)
      @tour.route = route
    end

    respond_to do |format|
      if flag1 and flag and @tour.save
        format.html { redirect_to @tour, notice: 'Тур успешно создан.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Тур успешно изменен.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Тур успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:start_date, :days_in_tour, :route_id, :add_price, :add_descr,
      route_attributes: [:id, :name, :base_price, :descr, :city_id,
      city_attributes: [:name]])
    end
end
