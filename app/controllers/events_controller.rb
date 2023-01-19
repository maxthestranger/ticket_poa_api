class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy my_events]
  before_action :set_event, only: %i[show update destroy]

  def index
    @events = Event.all
    render json: @events
  end

  def my_events
    @events = current_user.events
    render json: @events
  end

  def show
    render json: @event, include: :category
  end

  def create
    #   create event and tickets in one transaction
    @event = current_user.events.create!(event_params)
    @tickets = ticket_params.map do |ticket|
      @event.tickets.create!(ticket)
    end

    Event.increase_category_event_count(@event.category_id)

    render json: @event, include: :tickets
  end

  def update
    # update events and tickets in one transaction
    @event.update!(event_params)
    @event.tickets.destroy_all
    @tickets = ticket_params.map do |ticket|
      @event.tickets.create!(ticket)
    end
    render json: @event, include: :tickets
  end

  def destroy
    @event.destroy
    Event.decrease_category_event_count(@event.category_id)
  end

  private

  def event_params
    params.require(:event).permit(:title, :type, :description, :venue_url, :poster, :venue_name, :video_url, :start_date, :end_date, :live, :category_id)
  end

  def ticket_params
    params.require(:tickets).map do |ticket|
      ticket.permit(:name, :quantity, :price, :detail)
    end
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
