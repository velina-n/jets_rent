class JetsController < ApplicationController
  def index
    @jets = Jet.all
  end

  def new
    @jet = Jet.new
  end

  def create
    @jet = Jet.new(jet_params)
    @jet.user = current_user

    if @jet.save
      redirect_to jet_path(@jet), notice: "Jet successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @jet = Jet.find(params[:id])
  end

  private

  def jet_params
    params.require(:jet).permit(:model, :price, :available, :capacity)
  end
end
