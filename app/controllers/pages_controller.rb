class PagesController < ApplicationController
  def home
    @jets = Jet.limit(6)
  end

  def dashboard
    @user = current_user
    @jets = current_user.jets
    @bookings = Booking.where(user_id: current_user.id)
  end
end
