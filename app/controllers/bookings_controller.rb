class BookingsController < ApplicationController
  def my_requests
    @my_requests = Booking.where(user: current_user)
  end
end
