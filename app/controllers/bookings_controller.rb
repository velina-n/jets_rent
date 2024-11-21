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
    @booking.jet = @jet
    @booking.status = "pending"

    if @booking.save
      # Redirige vers la page du jet en cas de succès
      redirect_to jet_path(@jet), notice: "Votre réservation a été créée avec succès."
    else
      # Recharger la page show avec les erreurs du formulaire
      @jet = @booking.jet
      render "jets/show", status: :unprocessable_entity
    end
  end


    private

  def set_jet
    @jet = Jet.find(params[:jet_id])
  end

  def booking_params
    params.require(:booking).permit(:airport, :start_date, :end_date, :special_requests)
  end
end
