class PagesController < ApplicationController
  def home
    places = Place.all.shuffle
    @sample_places1 = places.shift(4)
    @sample_places2 = places.shift
    @sample_places3 = places.shift(2)
  end
end
