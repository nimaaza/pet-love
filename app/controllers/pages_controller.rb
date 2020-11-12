class PagesController < ApplicationController
  def home
    places = Place.all.shuffle
    @sample_places1 = places.sample(2)
    @sample_places2 = places.sample
    @sample_places3 = places.sample(2)
  end
end
