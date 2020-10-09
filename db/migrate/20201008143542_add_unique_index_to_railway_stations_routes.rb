class AddUniqueIndexToRailwayStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    add_index :railway_stations_routes, [:railway_station_id, :route_id], unique: true, name:"station_route_unique"
  end
end
