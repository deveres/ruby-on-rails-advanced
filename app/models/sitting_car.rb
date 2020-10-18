class SittingCar < Car
  validates :bottom_seats, presence: true, numericality: {only_integer: true}


  PLACES = {
      bottom: I18n.t('cars.sitting_places')
  }.freeze

end

