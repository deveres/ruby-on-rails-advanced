class AddStationOrderToRailwayStationsRoutesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :railway_stations_routes, :position, :integer, default: 0
  end
end
