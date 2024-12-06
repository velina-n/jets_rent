# app/controllers/jets_controller.rb
class JetsController < ApplicationController
  def index
    @jets = Jet.where.not(user: current_user)
  end

  def new
    @jet = Jet.new
  end

  def create
    @jet = Jet.new(jet_params)
    @jet.user = current_user
    if @jet.save
      redirect_to dashboard_path, notice: "Jet successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @jet = Jet.find(params[:id])
  end

  def show
    @jet = Jet.find(params[:id])
    @booking = Booking.new
  end

  private

  def jet_params
    params.require(:jet).permit(:model, :price, :capacity, :available, images: [])
  end
end
