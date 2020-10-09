class Train < ApplicationRecord
  validates :number, presence: true,
            uniqueness: { case_sensitive: false, message: "Такой поезд уже существует" },
            length: { minimum: 5 },
            format: { with: /\A[a-z0-9]{3}-?[a-z0-9]{2}\z/,
                      message: "Не правильный формат номера поезда" }



  belongs_to :route
  has_many :tickets,  dependent: :destroy
  has_many :cars,  dependent: :destroy

  # Count type car seats
  def car_seats(car_type, seat_type)
    Car.where(type_id: car_type, train_id: self.id).sum("#{seat_type}_seats")
  end

  def cars_total(car_type)
    Car.where(type_id: car_type, train_id: self.id).count()
  end

end
