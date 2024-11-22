class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :decline]

  def create
    @jet = Jet.find(params[:jet_id]) # Trouve le jet associé
    @booking = @jet.bookings.new(booking_params) # Associe la réservation au jet
    @booking.user = current_user # Associe la réservation à l'utilisateur connecté

    if @booking.save
      redirect_to dashboard_path, notice: "Réservation créée avec succès !" # Redirection vers le dashboard
    else
      flash.now[:alert] = "Une erreur s'est produite. Veuillez vérifier les informations."
      render "jets/show" # Re-render le formulaire en cas d'erreur
    end
  end

  # Accepter une réservation
  def accept
    @booking.update(status: 'accepted')
    redirect_to dashboard_path, notice: "Réservation acceptée avec succès."
  end

  # Refuser une réservation
  def decline
    @booking.update(status: 'declined')

    redirect_to dashboard_path, notice: "La réservation a été refusée et supprimée."
  end

  private

  # Trouver la réservation
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Strong parameters (si nécessaire)
  def booking_params
    params.require(:booking).permit(:airport, :start_date, :end_date, :special_requests)
  end
end
