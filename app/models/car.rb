class Car < ApplicationRecord

  validates :top_seats, presence: true, numericality: { only_integer: true }
  validates :bottom_seats, presence: true, numericality: { only_integer: true }
  validates :type_id, presence: true, numericality: { only_integer: true }

  belongs_to :train

  CAR_TYPE = { 1 => 'Плацкартный', 2 => 'Купейный' }.freeze
  CAR_PLACES = { top: 'Верхних', bottom: 'Нижних' }.freeze
  CAR_TYPE_COLLECTION = {
    economy: { type: 1, label: 'Плацкартных' },
    premium: { type: 2, label: 'Купейных' }
  }.freeze

end
