class PremiumCar < Car
  validates :bottom_seats, presence: true, numericality: {only_integer: true}


  PLACES = {
      bottom: 'Нижние'
  }.freeze

end