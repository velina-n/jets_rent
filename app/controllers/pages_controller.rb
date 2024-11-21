class PagesController < ApplicationController
  def home
    @jets = Jet.limit(6)
  end

  def dashboard
    @jets = Jet.all # Exemple d'affichage des jets sur le tableau de bord
    if user_signed_in? # Vérification correcte avec `?`
      @bookings = current_user.bookings # Affiche uniquement les réservations de l'utilisateur connecté
    end
  end
end
