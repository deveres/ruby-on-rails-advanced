class EconomyCar < Car
  validates :top_seats, presence: true, numericality: {only_integer: true}
  validates :bottom_seats, presence: true, numericality: {only_integer: true}

  validates :side_top_seats, presence: true, numericality: {only_integer: true}
  validates :side_bottom_seats, presence: true, numericality: {only_integer: true}


  PLACES = {
      bottom: 'Нижние',
      top: 'Верхние',
      side_bottom: 'Нижние боковые',
      side_top: 'Верхние боковые'
  }.freeze

end