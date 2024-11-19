class BookingsController < ApplicationController
  def index
  @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to bookings_path
  end
    private

  def set_bookings
      @task = Task.find(params[:id])
  end

  def booking_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
