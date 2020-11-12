class PlacesController < ApplicationController
  def index
    if params[:query].present?
      @places = Place.search_address_host(params[:query])
    else
      @places = Place.all
    end
  end

  def new
    @place = Place.new
  end

  def show
    @place = Place.find(params[:id])
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to places_url, notice: 'the place was successfully destroyed.'
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      redirect_to @place, notice: 'places was successfully updated.'
    else
      render :edit
    end
  end

  private

  def place_params
    params.require(:place).permit(:full_address, :description, :photo_url,
                                  :capacity, :title, :price, :user_id)
  end
end
