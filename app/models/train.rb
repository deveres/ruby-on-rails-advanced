class Train < ApplicationRecord
  validates :number, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 5},
            format: {with: /\A[a-z0-9]{3}-?[a-z0-9]{2}\z/}


  belongs_to :route
  has_many :tickets, dependent: :destroy
  has_many :cars

  # Count type car seats
  def car_seats(car_type, seat_type)
    print(car_type)
    Car.where(type: car_type, train_id: self.id).sum("#{seat_type}_seats")
  end

  def cars_total(car_type)
    Car.where(type: car_type, train_id: self.id).count()
  end

  def get_places(car_class)
    car_class::PLACES
  end

  def ordered_cars
    return self.cars.ordered_reverse if self.cars_order
    self.cars.ordered
  end
end
