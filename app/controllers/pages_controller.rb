class PagesController < ApplicationController
  def home
    @sample_places = Place.all.sample(3)
  end
end
