class RailwayStation < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5},
            uniqueness: {case_sensitive: false, message: "Такая станция уже существует"}

  has_many :trains, inverse_of: 'current_station'

  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  # cписок станций в маршруте
  def self.in_route(route)
    self.joins(:railway_stations_routes)
        .where(railway_stations_routes: {route: route})
        .select("railway_stations.id as id, railway_stations.title as title")

  end

  def update_params(route, params)
    station_route = station_route(route)
    station_route.update(params) if station_route

  end

  def delete_from_route(route)
    station_route = station_route(route)
    station_route.destroy if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def departure_time(route)
    station_route(route).try(:departure_time)
  end

  def arrival_time(route)
    station_route(route).try(:arrival_time)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
