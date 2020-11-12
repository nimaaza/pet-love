class BookingsController < ApplicationController
  def new
    @place = Place.find(params[:id])
    @booking = Booking.new
    @booking.place = @place
    @booking.user = current_user
  end

  def create
    booking = Booking.new(booking_params)
    booking.confirmed = false
    booking.user = current_user
    booking.place = Place.find(params[:id])

    if booking.save!
      redirect_to my_requests_path
    else
      render :new
    end
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy

    redirect_to my_requests_path
  end

  # non-CRUD actions
  def my_requests
    @my_requests = Booking.where(place: current_user.place, confirmed: false)
    @my_bookings = Booking.where(user: current_user, confirmed: false)
    @ongoing_bookings = Booking
                        .where(user: current_user, confirmed: true)
                        .select do |booking|
                          booking.booking_end_date > Time.now
                        end
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.confirmed = true
    @booking.save

    # destroy all pending requests from @booking.user
    pending_bookings = Booking.where(user: @booking.user, confirmed: false)
    pending_bookings.each { |booking| booking.destroy }

    redirect_to my_requests_path
  end

  private

  def booking_params
    params.require(:booking)
          .permit("pet_description",
                  "species",
                  "pet_photo_url",
                  "booking_start_date(1i)",
                  "booking_start_date(2i)",
                  "booking_start_date(3i)",
                  "booking_end_date(1i)",
                  "booking_end_date(2i)",
                  "booking_end_date(3i)",
                  "photo")
  end
end
