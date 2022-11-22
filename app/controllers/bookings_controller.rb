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
    @booking.user = current_user
    @booking.event = @event
    @pax = @booking.pax
    @booking.save
    @event.update(slot: @event.slot - @pax)
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
    flash[:alert] = "Booking Cancelled"
  end

  private

  def booking_params
    params.require(:booking).permit(:pax, :user_id, :event_id)
  end

end
