class RailwayStation < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 },
            uniqueness: { case_sensitive: false, message: "Такая станция уже существует" }

  has_many :trains, inverse_of: 'current_station'

  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes

end
