class PlacesController < ApplicationController
    
    
    def new
      @place = Place.new
    end
  
    def create
      @place = Place.new(place_params) 
      @place.user = current_user
      if @place.save
        # redirect_to place_path(@place)
      else
        render 'new'
      end
    end
  
    private
  
    def place_params
      params.require(:place).permit(:full_address, :description, :photo_url, :capacity)
    end
end
