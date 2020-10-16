class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy, :add_station_to]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to [:admin, @route], notice: 'Маршрут создан'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @route.update(route_params)
      redirect_to [:admin, @route], notice: 'Маршрут изменен'
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path, notice: 'Маршрут удален'
  end


  def add_station_to


    @railway_stations_route = RailwayStationsRoute.new({
                                                           railway_station_id: params[:railway_station_id],
                                                           position: params[:position]
                                                       })
    @railway_stations_route.route = @route

    if (@railway_stations_route.save)
      redirect_to [:admin, @route], notice: "Станция успешно добавлена в маршрут"
    else
      redirect_to [:admin, @route], alert: @railway_stations_route.errors.full_messages.first
    end


  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def route_params
    params.require(:route).permit(:name, railway_station_ids: [])
  end
end
