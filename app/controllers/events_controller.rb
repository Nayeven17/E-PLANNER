class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :find_index, only: [:edit, :update]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?
      @events = Event.search_by_title_and_description(params[:query])
    else
      @events = Event.all
    end

    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window: render_to_string(partial: "info_window", locals: {event: event })
      }
    end
  end

  def show
    @booking = Booking.new
    # @reviews = @event.reviews if (@event.reviews).exists?

    # if (@event.reviews).exists?
    #   @reviews = @event.reviews

    # end
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    respond_to do |format|
      if @event.save
        redirect_to event_url(@event), notice: "Your event has been created"
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    @event.update(event_params)
    redirect_to event_path(@event)
    flash[:alert] = "Your event has been updated."
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :category, :price, :start_date, :photo, :end_date, :location, :slot, :contact, :image_url, photos: [])
  end

  def booking_params
    params.require(:booking).permit(:pax, :user_id, :event_id)
  end

  def find_index

  end

end
