class Train < ApplicationRecord
  validates :number, presence: true,
            uniqueness: { case_sensitive: false, message: "Такой поезд уже существует" },
            length: { minimum: 5 },
            format: { with: /\A[a-z0-9]{3}-?[a-z0-9]{2}\z/,
                      message: "Не правильный формат номера поезда" }


  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :current_route, class_name: 'Route', foreign_key: :current_route_id

  has_many :tickets,  dependent: :destroy
end
