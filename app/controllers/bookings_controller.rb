class BookingsController < ApplicationController

  def index
    @bookings = Booking.all.select do |booking|
      booking.user == current_user
    end
  end

  def new
    @booking = Booking.new
    @event = Event.find(params[:event_id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.find(params[:event_id])
    @booking = Booking.new(booking_params)
    @booking.event = @event
    @booking.user = current_user
    @booking.save
    redirect_to event_bookings_path(@event)
    flash[:alert] = "Congratulation your event is booked !"
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to booking_path
    flash[:alert] = "Booking Cancelled"
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :event_id)
  end

end
