class BookingsController < ApplicationController
  def index
  @bookings = current_user.bookings
  end

  def new
    @jet = Jet.find(params[:jet_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @jet = Jet.find(params[:jet_id])
    @booking.jet = Jet.find(params[:jet_id])
    # puts "on a trouver le jet#{@booking.jet}"
    # puts "le user est #{@booking.jet}"
    @booking.status = "pending"

    if @booking.save
       # Vérifie si la réservation est correctement sauvegardée
      redirect_to jet_bookings_path(@booking.jet), notice: "Booking created successfully." # Redirection avec un message de succès
    else
      render :new # Si la sauvegarde échoue, on affiche à nouveau le formulaire de création
    end
  end

    private

  def booking_params
    params.require(:booking).permit(:airport, :start_date, :end_date, :special_requests)
  end
end
