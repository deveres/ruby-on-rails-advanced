class TicketsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_ticket, only: [:show, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @tickets = current_user.tickets
  end

  def show
    redirect_to tickets_path, alert: "Вы не можете просмотреть детали данного билета" unless current_user.owner_of?(@ticket)
  end

  def new
    @ticket = Ticket.new({
                             start_station_id: params[:start_station_id],
                             end_station_id: params[:end_station_id]
                         })

  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end


  def destroy
    if user_signed_in? && current_user.owner_of?(@ticket)
      @ticket.destroy
      redirect_to tickets_path, notice: 'Билет удален'
    else
      redirect_to tickets_path, alert: "Вы не можете удалить данный билет"
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  # Only allow a list of trusted parameters through.
  def ticket_params
    params.require(:ticket).permit(:train_id,
                                   :start_station_id,
                                   :end_station_id,
                                   :first_name,
                                   :last_name,
                                   :middle_name
    )
  end
end
