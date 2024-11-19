class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @jet_price = Booking.find(params[:id]).price
    #le multiplier par le nombre de jours louer
  end

    private

  def set_bookings
      @task = Task.find(params[:id])
  end
end
