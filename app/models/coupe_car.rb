class CoupeCar < Car
  validates :top_seats, presence: true, numericality: { only_integer: true }
  validates :bottom_seats, presence: true, numericality: { only_integer: true }



   PLACES = {
     bottom: 'Нижние',
     top: 'Верхние'
   }.freeze

end
