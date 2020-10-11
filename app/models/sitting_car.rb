class SittingCar < Car
  validates :bottom_seats, presence: true, numericality: {only_integer: true}


  PLACES = {
      bottom: 'Сидячие'
  }.freeze

end