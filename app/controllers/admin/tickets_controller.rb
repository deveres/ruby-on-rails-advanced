class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]


  def index
    @tickets = Ticket.all
  end

  def show
  end


  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket], notice: 'Билет обновлен'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path, notice: 'Билет удален'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def ticket_params
    params.require(:ticket).permit(:start_station_id,
                                   :end_station_id,
                                   :first_name,
                                   :last_name,
                                   :middle_name
    )
  end
end
