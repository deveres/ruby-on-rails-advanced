class RailwayStationsRoute < ApplicationRecord

  validates :railway_station_id, uniqueness: {scope: :route_id, message: "Такая станция уже есть в маршруте"}
  # validates :position, uniqueness: {scope: :route_id, message: "Уже есть станция с таким порядковым номером в данном маршщруте"}

  belongs_to :railway_station, touch: true
  belongs_to :route, touch: true


  default_scope { order(:position) }

end