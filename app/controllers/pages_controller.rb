class PagesController < ApplicationController
  def home
    @jets = Jet.limit(6)
  end
end
