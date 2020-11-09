class BookingsController < ApplicationController
  def my_requests
    @my_requests = Booking.where(user: current_user)
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.confirmed = true
    @booking.save
  end
end
