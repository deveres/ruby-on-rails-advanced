class EconomyCar < Car
  validates :top_seats, presence: true, numericality: {only_integer: true}
  validates :bottom_seats, presence: true, numericality: {only_integer: true}

  validates :side_top_seats, presence: true, numericality: {only_integer: true}
  validates :side_bottom_seats, presence: true, numericality: {only_integer: true}


  PLACES = {
      bottom: I18n.t('cars.bottom_places'),
      top: I18n.t('cars.top_places'),
      side_bottom: I18n.t('cars.side_bottom_places'),
      side_top: I18n.t('cars.side_top_places')

  }.freeze

end