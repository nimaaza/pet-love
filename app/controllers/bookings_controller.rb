class BookingsController < ApplicationController
  def destroy
    booking = Booking.find(params[:id])
    booking.destroy

    redirect_to my_requests_path
  end

  def my_requests
    @my_requests = Booking.where(place: current_user.place)
    @my_bookings = Booking.where(user: current_user)
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.confirmed = true
    @booking.save

    redirect_to my_requests_path
  end
end
