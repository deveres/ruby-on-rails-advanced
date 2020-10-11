class Car < ApplicationRecord

  validates :number, presence: true, uniqueness: {scope: :train_id}, numericality: {only_integer: true}

  validates :type, presence: true

  belongs_to :train

  #default_scope(order: :number)

  scope :economy, -> { where(type: 'EconomyCar') }
  scope :coupe, -> { where(type: 'CoupeCar') }
  scope :premium, -> { where(type: 'PremiumCar') }
  scope :sitting, -> { where(type: 'SittingCar') }

  scope :ordered, -> { order(:number) }
  scope :ordered_reverse, -> { order("number DESC") }

  CAR_TYPE = {
      EconomyCar: {label: 'Плацкартный', class: EconomyCar},
      CoupeCar: {label: 'Купейный', class: CoupeCar},
      PremiumCar: {label: 'Люксовый', class: PremiumCar},
      SittingCar: {label: 'Сидячий', class: SittingCar}
  }.freeze


  before_validation :set_serial_number

  PLACES = {}

  def car_type
    if new_record?
      return ''
    else
      CAR_TYPE[type.to_sym][:label] unless CAR_TYPE[type.to_sym].nil?
    end

  end


  private


  def set_serial_number
    self.number ||= next_serial_number
  end

  def next_serial_number
    cars = Car.where(train: train).ordered.all
    return 1 if cars.empty?

    last = cars.last.number + 1

    last
  end

end
