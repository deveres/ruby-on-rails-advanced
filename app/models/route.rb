class Route < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 },
            uniqueness: { case_sensitive: false, message: "Такой маршрут уже существует" }

  has_many :trains, inverse_of: 'current_route', foreign_key: :current_route_id

  has_many :railway_stations_routes,  dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes

end
