class RailwayStationsRoute < ApplicationRecord

  validates :railway_station_id, uniqueness: { scope: :route_id , message: "Такая станция уже есть в маршруте"}

  belongs_to :railway_station, touch: true
  belongs_to :route, touch: true
end