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

    if @booking.save  # Vérifie si la réservation est correctement sauvegardée
      redirect_to bookings_path, notice: "Booking created successfully."  # Redirection avec un message de succès
    else
      render :new  # Si la sauvegarde échoue, on affiche à nouveau le formulaire de création
    end
  end

    private

  def booking_params
    params.require(:booking).permit(:airport, :start_date, :end_date, :status, :special_requests, :jet_id, :user_id)
  end
end
