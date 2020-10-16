class Route < ApplicationRecord
  validates :name, presence: true, length: {minimum: 5},
            uniqueness: {case_sensitive: false, message: "Такой маршрут уже существует"}

  validate :stations_count

  has_many :trains

  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes

  before_validation :set_name

  def start_station
    railway_stations.first
  end

  def end_station
    railway_stations.last
  end

  def self.search(params)
    self.find_by_sql([self.search_query, params[:start_station_id], params[:end_station_id]])
  end

  private

  def set_name
    self.name ||= "#{railway_stations.first.title} - #{railway_stations.last.title}" if railway_stations?
  end

  def railway_stations?
    railway_stations.size >= 2
  end


  def stations_count

    errors.add(:base, "Маршурт должен иметь минимум 2 станции") unless railway_stations?

  end


  def self.search_query
    <<-SQL
      select routes.*,
       a.position as a_position,
       a.railway_station_id as a_station,
      b.position as b_position,
       b.railway_station_id as b_station
from routes
inner join railway_stations_routes as a on routes.id = a.route_id
       and a.railway_station_id = ?
inner join railway_stations_routes as b on routes.id = b.route_id
    and b.railway_station_id = ?
where a_position<b_position


    SQL
  end

end
