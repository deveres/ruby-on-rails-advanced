class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  # GET /trains
  # GET /trains.json
  def index
    @trains = Train.all
  end

  # GET /trains/1
  # GET /trains/1.json
  def show
  end

  # GET /trains/new
  def new
    @train = Train.new
  end

  # GET /trains/1/edit
  def edit
  end

  # POST /trains
  # POST /trains.json
  def create
    @train = Train.new(train_params)

    respond_to do |format|
      if @train.save
        format.html { redirect_to [:admin, @train], notice: I18n.t('notices.train_created') }
        format.json { render :show, status: :created, location: @train }
      else
        format.html { render :new }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trains/1
  # PATCH/PUT /trains/1.json
  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to [:admin, @train], notice: I18n.t('notices.train_updated') }
        format.json { render :show, status: :ok, location: @train }
      else
        format.html { render :edit }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trains/1
  # DELETE /trains/1.json
  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to admin_trains_path, notice: I18n.t('notices.train_deleted') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_train
    @train = Train.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def train_params
    params.require(:train).permit(:number, :route_id, :cars_order)
  end
end
