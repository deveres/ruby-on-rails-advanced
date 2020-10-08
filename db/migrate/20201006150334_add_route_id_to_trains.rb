class AddRouteIdToTrains < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :trains, :current_route
  end
end
