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
    event_details = event_params.merge(user_id: current_user.id)
    @event = Event.new(event_details)
    if @event.save
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :type, :description, :venue_url, :poster, :venue_name, :video_url, :start_date, :end_date, :live, :category_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
