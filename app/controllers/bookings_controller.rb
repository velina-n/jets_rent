class BookingsController < ApplicationController
  def create
    @jet = Jet.find(params[:jet_id]) # Trouve le jet associé
    @booking = @jet.bookings.new(booking_params) # Associe la réservation au jet
    @booking.user = current_user # Associe la réservation à l'utilisateur connecté

    if @booking.save
      redirect_to jet_path(@jet), notice: 'Réservation créée avec succès!'
    else
      # Affiche les erreurs de validation pour débogage
      Rails.logger.debug(@booking.errors.full_messages.join(", "))
      render 'jets/show', status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:airport, :start_date, :end_date, :special_requests)
  end
end
