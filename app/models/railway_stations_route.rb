class RailwayStationsRoute < ApplicationRecord

  belongs_to :railway_station, touch: true
  belongs_to :route, touch: true
end