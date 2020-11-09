class PagesController < ApplicationController
  def home
    @sample_places = Place.all.sample(4)
  end
end
