class CoupeCar < Car
  validates :top_seats, presence: true, numericality: { only_integer: true }
  validates :bottom_seats, presence: true, numericality: { only_integer: true }


   PLACES = {
     bottom: I18n.t('cars.bottom_places'),
     top: I18n.t('cars.top_places')
   }.freeze

end
