class BookingsController < ApplicationController
  def index
  @bookings = Booking.all
  end 
    private

  def set_bookings
      @task = Task.find(params[:id])
  end
end
