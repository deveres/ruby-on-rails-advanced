class RailwayStationsRoutesController < ApplicationController
  #http_basic_authenticate_with name:'admin', password:'123'

  before_action :set_railway_stations_route, only: [:destroy]

  def create
    @route = Route.find(params[:route_id])
    @railway_stations_route = RailwayStationsRoute.new(railway_stations_route_params)
    @railway_stations_route.route = @route

    if (@railway_stations_route.save)
      redirect_to route_path(@route),  notice: "Станция успешно добавлена в маршрут"
    else
      redirect_to route_path(@route), alert:  @railway_stations_route.errors.full_messages.first
    end

  end

  def destroy
    @route = @railway_stations_route.route
    @railway_stations_route.destroy
    redirect_to route_path(@route)
  end


  private

  def set_railway_stations_route
    @railway_stations_route = RailwayStationsRoute.find(params[:id])
  end

  def railway_stations_route_params
    params.require(:railway_stations_route).permit(:railway_station_id)
  end
end
