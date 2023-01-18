class TicketsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_ticket, only: %i[show update destroy]

  def destroy
    @ticket.destroy
  end

  private

  def set_event
    @ticket = Ticket.find(params[:id])
  end
end
