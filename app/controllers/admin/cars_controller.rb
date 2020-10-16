class Admin::CarsController < Admin::BaseController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]


  def show
  end

  def new
    @car = Car.new
  end

  def create

    @car = @train.cars.build(car_params)


    if @car.save
      redirect_to [:admin, @train], notice: 'Вагон добавлен'
    else
      render 'new'
    end
  end

  def edit
    @train = @car.train
  end

  def update
    if @car.update(car_params)
      redirect_to [:admin, @car.train]
    else
      render :edit
    end
  end

  def destroy
    train = @car.train
    @car.destroy
    redirect_to [:admin, train], notice: 'Вагон удален'
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:type, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :train_id)
  end
end
