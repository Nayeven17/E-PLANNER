class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
  end

  def show

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
  end

  def destroy
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:event_title, :description, :category, :price, :start_date, :end_date, :location, :slot, :contact, :image_url)
  end
end
