class Admin::RailwayStationsController < Admin::BaseController

  include ApplicationHelper


  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_params, :delete_from_route]

  # GET /railway_stations
  # GET /railway_stations.json
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1
  # GET /railway_stations/1.json
  def show
  end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit
  end

  # POST /railway_stations
  # POST /railway_stations.json
  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html { redirect_to [:admin, @railway_station], notice: I18n.t('notices.railway_station_created') }
        format.json { render :show, status: :created, location: @railway_station }
      else
        format.html { render :new }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /railway_stations/1
  # PATCH/PUT /railway_stations/1.json
  def update

    #render text: params

    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to [:admin, @railway_station], notice: I18n.t('notices.railway_station_updated') }
        format.json { render :show, status: :ok, location: @railway_station }
      else
        format.html { render :edit }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_params
    @route = Route.find(params[:route_id])
    railway_station_params = {
        position: params[:position],
        departure_time: date_hash_to_datetime(params[:departure_time]),
        arrival_time: date_hash_to_datetime(params[:arrival_time])
    }

    if (@railway_station.update_params(@route, railway_station_params))
      redirect_to [:admin, @route], notice: I18n.t('notices.data_updated')
    else
      redirect_to [:admin, @route], alert: I18n.t('alerts.data_not_updated')
    end
  end


  # DELETE /railway_stations/1
  # DELETE /railway_stations/1.json
  def destroy
    @railway_station.destroy
    respond_to do |format|
      format.html { redirect_to admin_railway_stations_path, notice: I18n.t('notices.railway_station_deleted') }
      format.json { head :no_content }
    end
  end

  def delete_from_route

    @route = Route.find(params[:route_id])
    @railway_station.delete_from_route(@route)

    redirect_to [:admin, @route], notice: I18n.t('notices.railway_station_deleted_from_route')

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end
