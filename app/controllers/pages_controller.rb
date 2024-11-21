class PagesController < ApplicationController
  def home
    @jets = Jet.limit(6)
  end

  def dashboard
    @user = current_user
    @jets = current_user.jets
    @bookings = @user.bookings
  end
end
