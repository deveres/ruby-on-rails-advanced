class Route < ApplicationRecord
  validates :name, presence: true, length: {minimum: 5},
            uniqueness: {case_sensitive: false, message: "Такой маршрут уже существует"}

  validate :stations_count

  has_many :trains

  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes

  before_validation :set_name

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}" if railway_stations?
  end

  def railway_stations?
    railway_stations.size >= 2
  end

  def stations_count

    errors.add(:base, "Маршурт должен иметь минимум 2 станции") unless railway_stations?

  end
end
