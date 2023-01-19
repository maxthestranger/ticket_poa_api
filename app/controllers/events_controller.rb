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
    render json: @event, include: [:tickets, :category]
  end

  def create
    @event = Event.new(event_params.merge(user_id: current_user.id))

    if @event.save
      @event.increase_category_event_count
      render json: @event, include: :tickets
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)

      render json: @event, include: :tickets
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    @event.decrease_category_event_count
  end

  private

  def event_params
    params.require(:event).permit(:title, :offline, :description, :venue_url, :poster, :venue_name, :video_url, :start_date, :end_date, :live, :category_id, tickets_attributes: %i[name price quantity detail])
  end
  
  def set_event
    @event = Event.find(params[:id])
  end
end
