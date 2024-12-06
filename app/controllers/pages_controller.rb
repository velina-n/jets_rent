class PagesController < ApplicationController
  def home
    @jets = Jet.limit(6)
  end

  def dashboard
    @jets = current_user.jets # Exemple d'affichage des jets sur le tableau de borde
    if user_signed_in? # Vérification correcte avec `?`
      @bookings = current_user.bookings # Affiche uniquement les réservations de l'utilisateur connecté
    end
    @bookings_for_my_jets = Booking.where(jet_id: @jets.pluck(:id))
  end
end
